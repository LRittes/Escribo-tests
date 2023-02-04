import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_character/get_character.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_movies.dart/get_movies.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_user/get_user.dart';
import 'package:app_movies/src/modules/home/domain/usecases/save_user/save_user.dart';
import 'package:app_movies/src/modules/home/presenters/states/movie_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends ChangeNotifier {
  MovieState _state = MovieInitialState([]);
  MovieState get state => _state;

  List<Movie> _listMovies = <Movie>[];
  List<Character> listCharacters = <Character>[];
  late User user;
  late List listFavs;

  _emitMovieState(MovieState newState) {
    _state = newState;
    notifyListeners();
  }

  init() async {
    user = await getUser();
    listFavs = [...user.favCharacters, ...user.favMovies];

    try {
      _emitMovieState(MovieLoadingState());
      _listMovies = (await getMovies()).map((e) {
        listFavs.any((movie) => movie.name == e.name)
            ? e.fav = true
            : e.fav = false;
        return e;
      }).toList();

      _emitMovieState(MovieLoadedState(_listMovies));
    } catch (e) {
      _emitMovieState(MovieFailureState(e.toString()));
    }

    listCharacters = (await getCharacters()).map((e) {
      listFavs.any((movie) => movie.name == e.name)
          ? e.fav = true
          : e.fav = false;
      return e;
    }).toList();
  }

  Future<List<Movie>> getMovies() async {
    var listMovies = await Modular.get<GetMovies>().call();
    notifyListeners();
    return listMovies.getOrElse((l) {
      return <Movie>[];
    });
  }

  void exchange(List list, int idx) {
    list[idx].fav = !list[idx].fav;
    addFavs(list[idx], list[idx].fav);

    notifyListeners();
  }

  Future<List<Character>> getCharacters() async {
    var usecase = await Modular.get<GetCharacters>().call();
    notifyListeners();

    return usecase.getOrElse((l) {
      return <Character>[];
    });
  }

  Future<User> getUser() async {
    var usecase = await Modular.get<GetUser>().call();
    notifyListeners();

    return usecase.getOrElse((l) {
      return User(
        avatar: '',
        favCharacters: [],
        favMovies: [],
      );
    });
  }

  Future<void> saveUser(User user) async {
    user.favMovies.clear();
    user.favCharacters.clear();
    listFavs.forEach((item) {
      if (item is Movie) {
        user.favMovies.add(item);
      } else {
        user.favCharacters.add(item);
      }
    });
    var usecase = await Modular.get<SaveUser>().call(user);
    usecase.getOrElse((l) {});
  }

  void addFavs(item, bool fav) {
    if (fav && !(listFavs.any((movie) => movie.name == item.name))) {
      listFavs.add(item);
    } else {
      listFavs.removeWhere((movie) => movie.name == item.name);
    }

    saveUser(user);
    notifyListeners();
  }
}

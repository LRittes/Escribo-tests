import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_character/get_character.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_movies.dart/get_movies.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_user/get_user.dart';
import 'package:app_movies/src/modules/home/domain/usecases/save_user/save_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends ChangeNotifier {
  List<Movie> listMovies = <Movie>[];
  List<Character> listCharacters = <Character>[];
  late User user;
  late List listFavs;

  init() async {
    user = await getUser();
    listFavs = [...user.favCharacters, ...user.favMovies];

    listMovies = (await getMovies()).map((e) {
      listFavs.any((movie) => movie.name == e.name)
          ? e.fav = true
          : e.fav = false;
      return e;
    }).toList();

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

  void exchange(List list, int idx) {
    list[idx].fav = !list[idx].fav;
    addFavs(list[idx], list[idx].fav);

    notifyListeners();
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

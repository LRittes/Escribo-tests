import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_character/get_character.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_movies.dart/get_movies.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_user/get_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends ChangeNotifier {
  List<Movie> listMovies = <Movie>[];
  List<Character> listCharacters = <Character>[];
  late User user = User(
    avatar: '',
    favCharacters: [],
    favMovies: [],
  );
  late List listFavs = [...user.favCharacters, ...user.favMovies];

  init() async {
    listMovies = await getMovies();

    listCharacters = await getCharacters();

    user = await getUser();
    listFavs = [...user.favCharacters, ...user.favMovies];
  }

  Future<List<Movie>> getMovies() async {
    var usecase = await Modular.get<GetMovies>().call();
    notifyListeners();
    return usecase.getOrElse((l) {
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
      print(l.message);

      print(l.stackTrace);
      return User(
        avatar: '',
        favCharacters: [],
        favMovies: [],
      );
    });
  }
}

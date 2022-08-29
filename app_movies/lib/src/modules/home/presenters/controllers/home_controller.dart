import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_movies.dart/get_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends ChangeNotifier {
  late List<Movie> listMovies = <Movie>[];
  late List<Character> listCharacters = [];

  init() async {
    listMovies = await getMovies();
    notifyListeners();
  }

  Future<List<Movie>> getMovies() async {
    var usecase = await Modular.get<GetMovies>().call();
    return usecase.getOrElse((l) {
      return <Movie>[];
    });
  }
}

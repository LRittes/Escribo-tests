import 'package:app_movies/src/modules/home/domain/entities/movie.dart';

abstract class MovieState {}

class MovieInitialState extends MovieState {
  final List<Movie> movies;

  MovieInitialState(this.movies);
}

class MovieLoadingState extends MovieState {
  final String message = "Loading movies";
}

class MovieLoadedState extends MovieState {
  final List<Movie> movies;

  MovieLoadedState(this.movies);
}

class MovieFailureState extends MovieState {
  final String message;

  MovieFailureState(this.message);
}

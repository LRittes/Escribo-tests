import 'package:app_movies/src/modules/home/domain/entities/movie.dart';

abstract class GetMovies {
  Future<List<Movie>> getMovies();
}

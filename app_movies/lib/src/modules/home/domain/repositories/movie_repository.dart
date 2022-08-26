import 'package:app_movies/src/modules/home/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getMovies();
}

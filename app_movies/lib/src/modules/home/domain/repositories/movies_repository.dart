import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:fpdart/fpdart.dart';

abstract class MoviesRepository {
  Future<Either<MovieException, List<Movie>>> getMovies();
}

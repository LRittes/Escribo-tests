import 'package:app_movies/src/modules/home/data/datasource/interface/movie_datasource.dart';
import 'package:app_movies/src/modules/home/data/dtos/dto_movie.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/domain/repositories/movies_repository.dart';
import 'package:fpdart/fpdart.dart';

class MoviesRepositoryImp extends MoviesRepository {
  late final MoviesDatasource _moviesDatasource;

  MoviesRepositoryImp(MoviesDatasource moviesDatasource) {
    _moviesDatasource = moviesDatasource;
  }

  @override
  Future<Either<MovieException, List<Movie>>> getMovies() async {
    try {
      List list = await _moviesDatasource.getMovies();
      List<Movie> listT = list.map(DTOMovie.fromJson).toList();
      return right(listT);
    } catch (e) {
      return left(MovieException(e.toString()));
    }
  }
}

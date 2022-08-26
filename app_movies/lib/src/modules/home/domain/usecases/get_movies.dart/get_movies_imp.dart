import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/domain/repositories/movies_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_movies.dart/get_movies.dart';

class GetMoviesImp implements GetMovies {
  late final MoviesRepository _moviesRepository;

  GetMoviesImp(MoviesRepository moviesRepository) {
    _moviesRepository = moviesRepository;
  }

  @override
  Future<List<Movie>> call() async {
    return await _moviesRepository.getMovies();
  }
}

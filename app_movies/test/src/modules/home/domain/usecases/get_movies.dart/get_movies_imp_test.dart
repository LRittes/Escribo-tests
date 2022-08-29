import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:app_movies/src/modules/home/domain/repositories/movies_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_movies.dart/get_movies_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MoviesRepositoryMock extends Mock implements MoviesRepository {}

class Error extends Mock implements MovieException {}

void main() {
  var repository = MoviesRepositoryMock();
  var usecase = GetMoviesImp(repository);

  test('Must return a movie empty list', () async {
    when(() => repository.getMovies()).thenAnswer((i) async => const Right([]));

    var result = await usecase();

    expect(result.fold(id, (r) => r.length), equals(0));
  });

  test('Must return a movie list with one movie', () async {
    when(() => repository.getMovies())
        .thenAnswer((i) async => Right([Movie(name: 'title1')]));

    var result = await usecase();

    expect(result.fold(id, (r) => r.length), equals(1));
    expect(result.fold(id, (r) => r[0]), isA<Movie>());
  });

  test('Must return a movie exception', () async {
    when(() => repository.getMovies()).thenAnswer((i) async => Left(Error()));

    var result = await usecase();

    expect(result.isLeft(), equals(true));
  });
}

import 'package:app_movies/src/modules/home/data/datasource/interface/movie_datasource.dart';
import 'package:app_movies/src/modules/home/data/repositories/movie_repository.dart';
import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

class MoviesDatasourceMock extends Mock implements MoviesDatasource {}

void main() {
  var datasource = MoviesDatasourceMock();
  var usecase = MoviesRepositoryImp(datasource);
  test('Must return a Movie list', () async {
    when(() => datasource.getMovies()).thenAnswer((i) async => [
          {"name": "title1", "fav": false}
        ]);

    var result = await usecase.getMovies();

    expect(result.isRight(), equals(true));
    expect(result.fold(id, id), isA<List<Movie>>());
    expect(result.fold(id, (r) => r[0].name), equals("title1"));
  });

  test('Must return a Movie Exception', () async {
    when(() => datasource.getMovies()).thenThrow(Exception);

    var result = await usecase.getMovies();

    expect(result.isLeft(), equals(true));
    expect(result.fold(id, id), isA<MovieException>());
  });
}

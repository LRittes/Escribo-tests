import 'package:app_movies/src/modules/home/data/datasource/remoto/api/movie_datasource_imp.dart';
import 'package:app_movies/src/modules/home/data/datasource/services/implementations/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  var serv = DioServiceImp();
  var usecase = MoviesDatasourceImp(serv);

  var result = await usecase.getMovies();
  test("Must return a list of movies in json", () async {
    expect(result, isA<List<Map<String, dynamic>>>());
  }, timeout: const Timeout(Duration(minutes: 1)));
  test('Must return the name of the first movie', () {
    expect(result[0]["title"], equals("A New Hope"));
  });
}

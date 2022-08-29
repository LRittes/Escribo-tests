import 'package:app_movies/src/modules/home/data/datasource/services/implementations/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Must return 6 movies from request for movie api', () async {
    var usecase = DioServiceImp();
    var result = await usecase.get('https://swapi.dev/api/films/');
    expect(result["count"], equals(6));
  }, timeout: const Timeout(Duration(minutes: 1)));
}

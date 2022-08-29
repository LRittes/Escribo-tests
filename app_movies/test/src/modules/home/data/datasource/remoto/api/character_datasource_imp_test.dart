import 'package:app_movies/src/modules/home/data/datasource/remoto/api/character_datasource_imp.dart';
import 'package:app_movies/src/modules/home/data/datasource/services/implementations/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  var serv = DioServiceImp();
  var usecase = CharactersDatasourceImp(serv);
  var list = await usecase.getCharacters();

  test('Must return a list of the characters in json', () {
    expect(list, isA<List<Map<String, dynamic>>>());
  });
  test('Must return a list with all characters', () {
    expect(list.length, equals(82));
  });
  test('Must return a name of the first character', () {
    expect(list[0]["name"], equals("Luke Skywalker"));
  });
}

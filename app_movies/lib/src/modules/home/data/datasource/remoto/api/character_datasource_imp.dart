import 'package:app_movies/src/modules/home/data/datasource/interface/character_datasource.dart';
import 'package:app_movies/src/modules/home/data/datasource/services/interface/service.dart';

class CharactersDatasourceImp implements CharactersDatasource {
  final Service service;

  CharactersDatasourceImp(this.service);

  @override
  Future<List<Map<String, dynamic>>> getCharacters() async {
    final response = await service.get("https://swapi.dev/api/people/");
    return response["response"];
  }
}

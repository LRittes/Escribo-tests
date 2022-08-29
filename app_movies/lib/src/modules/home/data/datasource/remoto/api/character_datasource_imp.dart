import 'package:app_movies/src/modules/home/data/datasource/interface/character_datasource.dart';
import 'package:app_movies/src/modules/home/data/datasource/services/interface/service.dart';

class CharactersDatasourceImp implements CharactersDatasource {
  final Service service;

  CharactersDatasourceImp(this.service);

  @override
  Future<List<Map<String, dynamic>>> getCharacters() async {
    int page = 1;
    List<Map<String, dynamic>> list = [];
    var response =
        await service.get("https://swapi.dev/api/people/?page=$page");
    int totPage =
        (response["count"] / response['results'].toList().length).ceil();
    list = [...list, ...response['results'].toList()];
    do {
      page += 1;
      response = await service.get("https://swapi.dev/api/people/?page=$page");
      list = [...list, ...response['results'].toList()];
    } while (page < totPage);

    return list;
  }
}

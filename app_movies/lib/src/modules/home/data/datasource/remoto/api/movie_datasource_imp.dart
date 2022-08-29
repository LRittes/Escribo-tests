import 'package:app_movies/src/modules/home/data/datasource/interface/movie_datasource.dart';
import 'package:app_movies/src/modules/home/data/datasource/services/interface/service.dart';

class MoviesDatasourceImp implements MoviesDatasource {
  final Service service;

  MoviesDatasourceImp(this.service);

  @override
  Future<List<Map<String, dynamic>>> getMovies() async {
    final response = await service.get("https://swapi.dev/api/films/");
    var list = response['results'].toList();
    return [...list];
  }
}

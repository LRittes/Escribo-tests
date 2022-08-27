import 'package:app_movies/src/modules/home/domain/entities/movie.dart';

class DTOMovie {
  static Movie fromJson(dynamic data) {
    return Movie(
      name: data['name'],
      fav: data['fav'],
    );
  }

  static Map<String, dynamic> toJson(Movie movie) {
    return {
      "name": movie.name,
      "fav": movie.fav,
    };
  }
}

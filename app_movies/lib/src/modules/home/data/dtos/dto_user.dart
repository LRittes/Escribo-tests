import 'package:app_movies/src/modules/home/data/dtos/dto_character.dart';
import 'package:app_movies/src/modules/home/data/dtos/dto_movie.dart';
import 'package:app_movies/src/modules/home/domain/entities/user.dart';

class DTOUser {
  static User fromJson(dynamic data) {
    return User(
      avatar: data['avatar'],
      favMovies: (data['favMovies'] as List).map(DTOMovie.fromJson).toList(),
      favCharacters:
          (data['favCharacters'] as List).map(DTOCharacter.fromJson).toList(),
    );
  }

  static Map<String, dynamic> toJson(User user) {
    return {
      "avatar": user.avatar,
      "favMovies": user.favMovies.map(DTOMovie.toJson).toList(),
      "favCharacters": user.favCharacters.map(DTOCharacter.toJson).toList(),
    };
  }
}

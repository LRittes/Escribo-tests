import 'package:app_movies/src/modules/home/domain/entities/character.dart';

class DTOCharacter {
  static Character fromJson(dynamic data) {
    return Character(
      name: data['name'],
      fav: data['fav'],
    );
  }

  static Map<String, dynamic> toJson(Character character) {
    return {
      "name": character.name,
      "fav": character.fav,
    };
  }
}

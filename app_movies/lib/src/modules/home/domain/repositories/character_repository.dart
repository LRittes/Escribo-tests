import 'package:app_movies/src/modules/home/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters();
}

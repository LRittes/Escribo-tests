import 'package:app_movies/src/modules/home/domain/entities/character.dart';

abstract class GetCharacters {
  Future<List<Character>> getCharacters();
}

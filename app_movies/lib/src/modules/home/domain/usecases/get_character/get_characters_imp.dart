import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/repositories/character_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_character/get_character.dart';

class GetCharactersImp implements GetCharacters {
  late final CharacterRepository _characterRepository;

  GetCharactersImp({required CharacterRepository characterRepository}) {
    _characterRepository = characterRepository;
  }

  @override
  Future<List<Character>> getCharacters() async {
    return await _characterRepository.getCharacters();
  }
}

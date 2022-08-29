import 'package:app_movies/src/modules/home/data/datasource/interface/character_datasource.dart';
import 'package:app_movies/src/modules/home/data/dtos/dto_character.dart';
import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:app_movies/src/modules/home/domain/repositories/character_repository.dart';
import 'package:fpdart/fpdart.dart';

class CharactersRepositoryImp extends CharactersRepository {
  late final CharactersDatasource _charactersDatasource;

  CharactersRepositoryImp(CharactersDatasource charactersDatasource) {
    _charactersDatasource = charactersDatasource;
  }

  @override
  Future<Either<CharacterException, List<Character>>> getCharacters() async {
    try {
      List list = await _charactersDatasource.getCharacters();
      List<Character> listT = list.map(DTOCharacter.fromJson).toList();
      return right(listT);
    } catch (e) {
      return left(CharacterException(e.toString()));
    }
  }
}

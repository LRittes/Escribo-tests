import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:fpdart/fpdart.dart';

abstract class CharactersRepository {
  Future<Either<CharacterException, List<Character>>> getCharacters();
}

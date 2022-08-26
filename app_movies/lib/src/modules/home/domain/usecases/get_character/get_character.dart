import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import 'package:app_movies/src/modules/home/domain/entities/character.dart';

abstract class GetCharacters {
  Future<Either<CharacterException, List<Character>>> call();
}

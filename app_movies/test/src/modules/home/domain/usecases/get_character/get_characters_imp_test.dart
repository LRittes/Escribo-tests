import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/repositories/character_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_character/get_characters_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CharactersRepositoryMock extends Mock implements CharacterRepository {}

void main() {
  var repository = CharactersRepositoryMock();
  var usecase = GetCharactersImp(repository);

  test('Must return a characters empty list', () async {
    when(() => repository.getCharacters()).thenAnswer((i) async => []);

    var result = await usecase();

    expect(result.length, equals(0));
  });

  test('Must return a characters list with one character', () async {
    when(() => repository.getCharacters())
        .thenAnswer((i) async => [Character(name: 'title1')]);

    var result = await usecase();

    expect(result.length, equals(1));
    expect(result[0], isA<Character>());
  });
}

import 'package:app_movies/src/modules/home/data/datasource/interface/character_datasource.dart';
import 'package:app_movies/src/modules/home/data/repositories/character_repository_imp.dart';
import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class CharactersDatasourceMock extends Mock implements CharactersDatasource {}

void main() {
  var datasource = CharactersDatasourceMock();
  var usecase = CharactersRepositoryImp(datasource);
  test('Must return a Character list', () async {
    when(() => datasource.getCharacters()).thenAnswer((i) async => [
          {"name": "title1", "fav": false}
        ]);

    var result = await usecase.getCharacters();

    expect(result.isRight(), equals(true));
    expect(result.fold(id, id), isA<List<Character>>());
    expect(result.fold(id, (r) => r[0].name), equals("title1"));
  });

  test('Must return a Character Exception', () async {
    when(() => datasource.getCharacters()).thenThrow(Exception);

    var result = await usecase.getCharacters();

    expect(result.isLeft(), equals(true));
    expect(result.fold(id, id), isA<CharacterException>());
  });
}

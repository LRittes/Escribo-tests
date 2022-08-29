import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:app_movies/src/modules/home/domain/repositories/character_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_character/get_characters_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class CharactersRepositoryMock extends Mock implements CharactersRepository {}

class Error implements CharacterException {
  @override
  String get message => 'error';

  @override
  StackTrace? get stackTrace => throw UnimplementedError();
}

void main() {
  var repository = CharactersRepositoryMock();
  var usecase = GetCharactersImp(repository);

  test('Must return a characters empty list', () async {
    when(() => repository.getCharacters())
        .thenAnswer((i) async => const Right([]));

    var result = await usecase();

    expect(result.fold(id, (r) => r.length), equals(0));
  });

  test('Must return a characters list with one character', () async {
    when(() => repository.getCharacters())
        .thenAnswer((i) async => Right([Character(name: 'title1')]));

    var result = await usecase();

    expect(result.fold(id, (r) => r.length), equals(1));
    expect(result.fold(id, (r) => r[0]), isA<Character>());
  });

  test('Must return a character exception', () async {
    when(() => repository.getCharacters())
        .thenAnswer((i) async => left(Error()));

    var result = await usecase();

    expect(result.isLeft(), equals(true));
  });
}

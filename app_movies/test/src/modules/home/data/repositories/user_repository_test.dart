import 'package:app_movies/src/modules/home/data/datasource/interface/user_datasource.dart';
import 'package:app_movies/src/modules/home/data/repositories/user_repository_imp.dart';
import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class DataSourceMock extends Mock implements UserDatasource {}

void main() {
  var datasource = DataSourceMock();
  var usecase = UserRepositoryImp(datasource);

  Map<String, Object> user = {
    "avatar": "asdada",
    "favMovies": [
      {"name": "title1", "fav": false}
    ],
    "favCharacters": [
      {"name": "name1", "fav": true}
    ],
  };
  User userT = User(
    avatar: "asdada",
    favMovies: [Movie(name: 'title1')],
    favCharacters: [Character(name: 'name1')],
  );

  List list = [];

  test('Must return a User from datasouce', () async {
    when(() => datasource.getUser()).thenAnswer((i) async => user);
    var result = await usecase.getUser();

    expect(result.fold(id, id), isA<User>());
  });

  test(
      'GetUser function: Must return a name == "title1" from first favMovies list position',
      () async {
    when(() => datasource.getUser()).thenAnswer((i) async => user);
    var result = await usecase.getUser();

    expect(result.fold(id, (r) => r.favMovies[0].name), equals('title1'));
  });

  test(
      'GetUser function: Must return a name == "name1" from first favCharacters list position',
      () async {
    when(() => datasource.getUser()).thenAnswer((i) async => user);
    var result = await usecase.getUser();

    expect(result.fold(id, (r) => r.favCharacters[0].name), equals('name1'));
  });

  test('Must return a User Exception when execute getUser function', () async {
    when(() => datasource.getUser()).thenThrow(Exception);
    var result = await usecase.getUser();

    expect(result.fold(id, id), isA<UserException>());
  });

  test('Must save a User', () async {
    when(() => datasource.saveUser(user))
        .thenAnswer((i) async => list.add(userT));
    await usecase.saveUser(userT);

    expect(list.length, equals(1));
  });

  test(
      'Save function: Must return a name == "name1" from first favCharacters list position',
      () async {
    when(() => datasource.saveUser(user))
        .thenAnswer((i) async => list.add(userT));
    await usecase.saveUser(userT);

    expect(list[0]["favMovies"][0]["name"], equals("title1"));
  });

  test('Must return a User Exception when execute saveUser function', () async {
    var list = [];

    when(() => datasource.saveUser(user)).thenThrow(Exception);

    expect((await usecase.saveUser(userT)).isLeft(), equals(true));
    expect(list.length, equals(0));
  });
}

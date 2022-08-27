import 'package:app_movies/src/modules/home/data/datasource/interface/user_datasource.dart';
import 'package:app_movies/src/modules/home/data/repositories/user_repository_imp.dart';
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
    "favMovies": [],
    "favCharacters": [],
  };
  User userT = User(
    avatar: "asdada",
    favMovies: [],
    favCharacters: [],
  );

  test('Must return a User from datasouce', () async {
    when(() => datasource.getUser()).thenAnswer((i) async => user);
    var result = await usecase.getUser();

    expect(result.fold(id, id), isA<User>());
  });

  test('Must return a User Exception when execute getUser function', () async {
    when(() => datasource.getUser()).thenThrow(Exception);
    var result = await usecase.getUser();

    expect(result.fold(id, id), isA<UserException>());
  });

  test('Must save a User ', () async {
    var list = [];

    when(() => datasource.saveUser(user))
        .thenAnswer((i) async => list.add(userT));
    await usecase.saveUser(userT);

    expect(list.length, equals(1));
  });

  test('Must return a User Exception when execute saveUser function', () async {
    var list = [];

    when(() => datasource.saveUser(user)).thenThrow(Exception);

    expect((await usecase.saveUser(userT)).isLeft(), equals(true));
    expect(list.length, equals(0));
  });
}

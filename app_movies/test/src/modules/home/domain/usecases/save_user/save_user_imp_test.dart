import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:app_movies/src/modules/home/domain/repositories/user_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/save_user/save_user_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

class Error extends Mock implements UserException {}

void main() {
  var repository = UserRepositoryMock();
  var usecase = SaveUserImp(repository);
  var userMock = User(avatar: 'asdadasd', favCharacters: [], favMovies: []);
  var listUsers = [];

  test('Must save one User', () {
    when(() => repository.saveUser(userMock))
        .thenAnswer((i) async => Right(listUsers.add(userMock)));

    usecase(userMock);

    expect(listUsers.length, equals(1));
  });

  test('Must return User Exception', () async {
    when(() => repository.saveUser(userMock))
        .thenAnswer((i) async => Left(Error()));

    var result = await usecase(userMock);

    expect(result.isLeft(), equals(true));
    expect(listUsers.length, equals(0));
  });
}

import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:app_movies/src/modules/home/domain/repositories/user_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_user/get_user_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

class Error extends Mock implements UserException {}

void main() {
  var repository = UserRepositoryMock();
  var usecase = GetUserImp(repository);

  test('Must return one User', () async {
    when(() => repository.getUser()).thenAnswer((i) async =>
        Right(User(avatar: 'avatar', favMovies: [], favCharacters: [])));

    var user = await usecase();

    expect(user.isRight(), equals(true));
    expect(user.fold(id, id), isA<User>());
  });

  test('Must return User Exception', () async {
    when(() => repository.getUser()).thenAnswer((i) async => Left(Error()));

    var user = await usecase();

    expect(user.isLeft(), equals(true));
  });
}

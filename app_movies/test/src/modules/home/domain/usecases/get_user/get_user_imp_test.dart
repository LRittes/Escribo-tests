import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/repositories/user_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_user/get_user_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  var repository = UserRepositoryMock();
  var usecase = GetUserImp(repository);

  test('Must return one User', () {
    when(() => repository.getUser()).thenAnswer(
        (i) async => User(avatar: 'avatar', favMovies: [], favCharacters: []));

    var user = usecase();

    expect(user, isA<Future<User>>());
  });
}

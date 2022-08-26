import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/repositories/user_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/save_user/save_user_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  var repository = UserRepositoryMock();
  var usecase = SaveUserImp(repository);
  var userMock = User(avatar: 'asdadasd', favCharacters: [], favMovies: []);
  var listUsers = [];

  test('Must save one User', () {
    when(() => repository.saveUser(userMock))
        .thenAnswer((i) async => listUsers.add(userMock));

    usecase(userMock);

    expect(listUsers.length, equals(1));
  });
}

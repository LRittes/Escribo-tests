import 'package:app_movies/src/modules/home/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();

  Future<void> saveUser(User user);
}

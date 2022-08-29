import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository {
  Future<Either<UserException, User>> getUser();

  Future<Either<UserException, void>> saveUser(User user);
}

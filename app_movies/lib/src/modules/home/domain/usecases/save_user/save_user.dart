import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:fpdart/fpdart.dart';

abstract class SaveUser {
  Future<Either<UserException, void>> call(User user);
}

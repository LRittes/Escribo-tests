import 'package:app_movies/src/modules/home/data/datasource/interface/user_datasource.dart';
import 'package:app_movies/src/modules/home/data/dtos/dto_user.dart';
import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:app_movies/src/modules/home/domain/repositories/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserRepositoryImp extends UserRepository {
  late final UserDatasource _userDatasource;

  UserRepositoryImp(UserDatasource userDatasource) {
    _userDatasource = userDatasource;
  }

  @override
  Future<Either<UserException, User>> getUser() async {
    try {
      var result = await _userDatasource.getUser();
      User user = DTOUser.fromJson(result);
      return right(user);
    } catch (e) {
      return left(UserException(e.toString()));
    }
  }

  @override
  Future<Either<UserException, void>> saveUser(User user) async {
    try {
      Map<String, dynamic> userToJson = DTOUser.toJson(user);
      return right(await _userDatasource.saveUser(userToJson));
    } catch (e) {
      return left(UserException(e.toString()));
    }
  }
}

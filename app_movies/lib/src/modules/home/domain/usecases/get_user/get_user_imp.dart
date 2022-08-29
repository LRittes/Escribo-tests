import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:app_movies/src/modules/home/domain/repositories/user_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_user/get_user.dart';
import 'package:fpdart/fpdart.dart';

class GetUserImp implements GetUser {
  late final UserRepository _userRepository;

  GetUserImp(UserRepository userRepository) {
    _userRepository = userRepository;
  }

  @override
  Future<Either<UserException, User>> call() async {
    return await _userRepository.getUser();
  }
}

import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/errors/errors.dart';
import 'package:app_movies/src/modules/home/domain/repositories/user_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/save_user/save_user.dart';
import 'package:fpdart/fpdart.dart';

class SaveUserImp implements SaveUser {
  late final UserRepository _userRepository;

  SaveUserImp(UserRepository userRepository) {
    _userRepository = userRepository;
  }

  @override
  Future<Either<UserException, void>> call(User user) async {
    return await _userRepository.saveUser(user);
  }
}

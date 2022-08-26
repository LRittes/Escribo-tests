import 'package:app_movies/src/modules/home/domain/entities/user.dart';
import 'package:app_movies/src/modules/home/domain/repositories/user_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/save_user/save_user.dart';

class SaveUserImp implements SaveUser {
  late final UserRepository _userRepository;

  SaveUserImp(UserRepository userRepository) {
    _userRepository = userRepository;
  }

  @override
  Future<void> call(User user) async {
    await _userRepository.saveUser(user);
  }
}

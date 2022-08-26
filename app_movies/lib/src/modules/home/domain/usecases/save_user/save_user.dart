import 'package:app_movies/src/modules/home/domain/entities/user.dart';

abstract class SaveUser {
  Future<void> call(User user);
}

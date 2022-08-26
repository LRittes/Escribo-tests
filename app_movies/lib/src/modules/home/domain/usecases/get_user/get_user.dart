import 'package:app_movies/src/modules/home/domain/entities/user.dart';

abstract class GetUser {
  Future<User> call();
}

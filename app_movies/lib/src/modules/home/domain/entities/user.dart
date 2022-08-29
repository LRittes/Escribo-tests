import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:app_movies/src/modules/home/domain/entities/movie.dart';

class User {
  final String avatar;
  final List<Movie> favMovies;
  final List<Character> favCharacters;

  User({
    required this.avatar,
    required this.favMovies,
    required this.favCharacters,
  });
}

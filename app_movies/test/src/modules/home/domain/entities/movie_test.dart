import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Must false when not putting fav on Movie Instance', () {
    var movie = Movie(name: 'title1');
    expect(movie.fav, equals(false));
  });

  test('Must true when putting fav on Movie Instance', () {
    var movie = Movie(name: 'title1', fav: true);
    expect(movie.fav, equals(true));
  });
}

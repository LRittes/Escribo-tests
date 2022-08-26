import 'package:app_movies/src/modules/home/domain/entities/character.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Must false when not putting fav on Caracter Instance', () {
    var character = Character(name: 'title1');
    expect(character.fav, equals(false));
  });

  test('Must true when putting fav on Movie Instance', () {
    var character = Character(name: 'title1', fav: true);
    expect(character.fav, equals(true));
  });
}

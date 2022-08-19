import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/core/decorations/fruits/simple_fruit_sprite_sheet.dart';

class SimpleFruit extends GameDecoration {
  final Vector2 simpleFruitPosition;

  SimpleFruit({required this.simpleFruitPosition})
      : super.withSprite(
            position: simpleFruitPosition,
            size: Vector2.all(20),
            sprite: SimpleFruitSprite.simpleFruit);
}

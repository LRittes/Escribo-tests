import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/core/characters/pacman/pacman.dart';
import 'package:pacman_game/core/decorations/fruits/hiper_fruit_sprite_sheet%20copy.dart';

class HiperFruit extends GameDecoration {
  final Vector2 simpleFruitPosition;

  HiperFruit({required this.simpleFruitPosition})
      : super.withSprite(
          position: simpleFruitPosition,
          size: Vector2.all(20),
          sprite: HiperFruitSprite.hiperFruit,
        );
}

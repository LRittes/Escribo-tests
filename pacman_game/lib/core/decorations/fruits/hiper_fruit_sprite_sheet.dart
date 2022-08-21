import 'package:bonfire/bonfire.dart';

class HiperFruitSprite {
  static Future<Sprite> get hiperFruit => Sprite.load(
        'game_sheet.png',
        srcPosition: Vector2(3 * 20, 1 * 20),
        srcSize: Vector2.all(20),
      );
}

import 'package:bonfire/bonfire.dart';

class SimpleFruitSprite {
  static Future<Sprite> get simpleFruit => Sprite.load(
        'game_sheet.png',
        srcPosition: Vector2(4 * 20, 1 * 20),
        srcSize: Vector2.all(20),
      );
}

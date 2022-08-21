import 'package:bonfire/bonfire.dart';

class SimpleFruitSprite {
  static Future<Sprite> get simpleFruit => Sprite.load(
        'point20x20.png',
        srcPosition: Vector2(0, 0),
        srcSize: Vector2.all(20),
      );
}

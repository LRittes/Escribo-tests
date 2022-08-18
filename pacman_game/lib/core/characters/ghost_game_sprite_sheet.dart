import 'package:bonfire/bonfire.dart';

class GhostSpriteSheet {
  double pixelSize = 20;
  Future<SpriteAnimation> get ghostidLeft => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 10 * pixelSize),
        ),
      );
  Future<SpriteAnimation> get ghostidRight => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 8 * pixelSize),
        ),
      );
  Future<SpriteAnimation> get ghostidDown => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 9 * pixelSize),
        ),
      );
  Future<SpriteAnimation> get ghostidUp => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 11 * pixelSize),
        ),
      );
  Future<SpriteAnimation> get ghostRunLeft => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, 10 * pixelSize),
        ),
      );
  Future<SpriteAnimation> get ghostRunRight => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, 8 * pixelSize),
        ),
      );
  Future<SpriteAnimation> get ghostRunDown => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, 9 * pixelSize),
        ),
      );
  Future<SpriteAnimation> get ghostRunUp => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, 11 * pixelSize),
        ),
      );
}

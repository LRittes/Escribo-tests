import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet {
  double pixelSize = 20;
  Future<SpriteAnimation> get heroidLeft => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 20),
        ),
      );
  Future<SpriteAnimation> get heroidRight => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 0),
        ),
      );
  Future<SpriteAnimation> get heroidDown => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 3 * pixelSize),
        ),
      );
  Future<SpriteAnimation> get heroidUp => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 2 * pixelSize),
        ),
      );
  Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, pixelSize),
        ),
      );
  Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, 0),
        ),
      );
  Future<SpriteAnimation> get heroRunDown => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, 3 * pixelSize),
        ),
      );
  Future<SpriteAnimation> get heroRunUp => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(pixelSize),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, 2 * pixelSize),
        ),
      );
}

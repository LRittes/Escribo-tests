import 'package:bonfire/bonfire.dart';

class GameSpriteSheet {
  static Future<SpriteAnimation> get heroidLeft => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(20),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 20),
        ),
      );
  static Future<SpriteAnimation> get heroidRight => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(20),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 0),
        ),
      );
  static Future<SpriteAnimation> get heroidDown => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(20),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 3 * 20),
        ),
      );
  static Future<SpriteAnimation> get heroidUp => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(20),
          stepTime: 0.15,
          loop: true,
          texturePosition: Vector2(0, 2 * 20),
        ),
      );
  static Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(20),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, 20),
        ),
      );
  static Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(20),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, 0),
        ),
      );
  static Future<SpriteAnimation> get heroRunDown => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(20),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, 3 * 20),
        ),
      );
  static Future<SpriteAnimation> get heroRunUp => SpriteAnimation.load(
        'game_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2.all(20),
          stepTime: 0.2,
          loop: true,
          texturePosition: Vector2(0, 2 * 20),
        ),
      );
}

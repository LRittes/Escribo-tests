import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/core/characters/gamespritsheet.dart';

class Pacman extends SimplePlayer with ObjectCollision {
  late Vector2 playerPosition;
  late Vector2 playerSize;
  Pacman({required position, required size})
      : super(
          position: position,
          size: size,
          animation: SimpleDirectionAnimation(
            idleRight: GameSpriteSheet.heroidRight,
            idleDown: GameSpriteSheet.heroidDown,
            idleLeft: GameSpriteSheet.heroidLeft,
            idleUp: GameSpriteSheet.heroidUp,
            runRight: GameSpriteSheet.heroRunRight,
            runLeft: GameSpriteSheet.heroRunLeft,
            runUp: GameSpriteSheet.heroRunUp,
            runDown: GameSpriteSheet.heroRunDown,
          ),
          speed: 80,
        ) {
    playerPosition = position;
    playerSize = size;
    setupCollision(CollisionConfig(
        collisions: [CollisionArea.rectangle(size: Vector2(18, 18))]));
  }
}

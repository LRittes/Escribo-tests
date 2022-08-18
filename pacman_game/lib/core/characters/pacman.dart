import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/core/characters/player_game_sprite_sheet.dart';

class Pacman extends SimplePlayer with ObjectCollision {
  final Vector2 playerPosition;
  final Vector2 playerSize;
  static final PlayerSpriteSheet playerSpriteSheet = PlayerSpriteSheet();
  Pacman({required this.playerPosition, required this.playerSize})
      : super(
          position: playerPosition,
          size: playerSize,
          animation: SimpleDirectionAnimation(
            idleRight: playerSpriteSheet.heroidRight,
            idleDown: playerSpriteSheet.heroidDown,
            idleLeft: playerSpriteSheet.heroidLeft,
            idleUp: playerSpriteSheet.heroidUp,
            runRight: playerSpriteSheet.heroRunRight,
            runLeft: playerSpriteSheet.heroRunLeft,
            runUp: playerSpriteSheet.heroRunUp,
            runDown: playerSpriteSheet.heroRunDown,
          ),
          speed: 80,
          life: 3,
        ) {
    setupCollision(CollisionConfig(
        collisions: [CollisionArea.rectangle(size: Vector2(18, 18))]));
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}

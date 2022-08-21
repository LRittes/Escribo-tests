import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/core/characters/ghost/ghost_game_sprite_sheet.dart';

class Ghost extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement {
  final Vector2 ghostPosition;
  final Vector2 ghostSize;
  static final GhostSpriteSheet playerSpriteSheet = GhostSpriteSheet();

  Ghost({
    required this.ghostPosition,
    required this.ghostSize,
  }) : super(
          position: ghostPosition,
          size: ghostSize,
          animation: SimpleDirectionAnimation(
            idleRight: playerSpriteSheet.ghostidRight,
            runRight: playerSpriteSheet.ghostRunRight,
          ),
          speed: 20,
          life: 1,
        ) {
    setupCollision(CollisionConfig(
        collisions: [CollisionArea.rectangle(size: Vector2(15, 15))]));
  }

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(playerSpriteSheet.dieLeft, runToTheEnd: true,
          onFinish: () {
        removeFromParent();
      });
    } else {
      animation?.playOnce(playerSpriteSheet.dieRight, runToTheEnd: true,
          onFinish: () {
        removeFromParent();
      });
    }
    super.die();
  }
}

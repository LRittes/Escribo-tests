import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/core/characters/pacman/pacman_game_sprite_sheet.dart';

enum Directions { right, left, up, down }

class Pacman extends SimplePlayer with ObjectCollision {
  final Vector2 playerPosition;
  final Vector2 playerSize;
  var diretion = Directions.right;
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
          speed: 10,
          life: 3,
        ) {
    setupCollision(CollisionConfig(
        collisions: [CollisionArea.rectangle(size: Vector2(18, 18))]));
  }

  @override
  void update(double dt) {
    if (diretion == Directions.right) {
      moveRight(60);
    } else if (diretion == Directions.left) {
      moveLeft(60);
    } else if (diretion == Directions.up) {
      moveUp(60);
    } else if (diretion == Directions.down) {
      moveDown(60);
    }
    super.update(dt);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}

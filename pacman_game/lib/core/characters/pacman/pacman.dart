import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/GamePage/controllers/game_controller.dart';
import 'package:pacman_game/core/characters/ghost/ghost.dart';
import 'package:pacman_game/core/characters/pacman/pacman_game_sprite_sheet.dart';
import 'package:pacman_game/utils/directions.dart';

class Pacman extends SimplePlayer with ObjectCollision {
  final Vector2 playerPosition;
  final Vector2 playerSize;
  Directions diretion = Directions.right;
  bool canMove = true;
  bool attack;
  static final PlayerSpriteSheet playerSpriteSheet = PlayerSpriteSheet();

  Pacman(
      {required this.playerPosition,
      required this.playerSize,
      required this.attack})
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
          speed: 100,
          life: 3,
        ) {
    setupCollision(CollisionConfig(
        collisions: [CollisionArea.rectangle(size: Vector2(17, 17))]));
  }

  @override
  void update(double dt) {
    if (canMove) {
      if (diretion == Directions.right) {
        moveRight(60);
      } else if (diretion == Directions.left) {
        moveLeft(60);
      } else if (diretion == Directions.up) {
        moveUp(60);
      } else if (diretion == Directions.down) {
        moveDown(60);
      }
    }

    super.update(dt);
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (MyGameController().attack) {
      if (component is Ghost) {
        simpleAttackMelee(
          damage: 1,
          size: Vector2.all(20),
          withPush: false,
        );
      }
    }
    return super.onCollision(component, active);
  }

  @override
  void die() {
    canMove = false;
    animation?.playOnce(
      playerSpriteSheet.dieHero,
      runToTheEnd: true,
      onFinish: () => removeFromParent(),
    );

    super.die();
  }
}

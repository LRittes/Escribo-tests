import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/core/characters/ghost/ghost.dart';
import 'package:pacman_game/core/characters/pacman/pacman_game_sprite_sheet.dart';
import 'package:pacman_game/core/decorations/fruits/hiper_fruit.dart';
import 'package:pacman_game/core/decorations/fruits/simple_fruit.dart';

enum Directions { right, left, up, down }

class Pacman extends SimplePlayer with ObjectCollision {
  final Vector2 playerPosition;
  final Vector2 playerSize;
  var diretion = Directions.right;
  bool canMove = true;
  ValueNotifier<bool> attack;
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
        collisions: [CollisionArea.rectangle(size: Vector2(18, 18))]));
  }

  @override
  void update(double dt) {
    // if (canMove) {
    //   if (diretion == Directions.right) {
    //     moveRight(60);
    //   } else if (diretion == Directions.left) {
    //     moveLeft(60);
    //   } else if (diretion == Directions.up) {
    //     moveUp(60);
    //   } else if (diretion == Directions.down) {
    //     moveDown(60);
    //   }
    // }
    seeComponentType<SimpleFruit>(
      observed: (fruit) {
        fruit.first.removeFromParent();
      },
      radiusVision: 2.5,
    );

    seeComponentType<HiperFruit>(
      observed: (fruit) {
        fruit.first.removeFromParent();
        attack.value = true;
        gameRef.enemies().forEach((e) => e.opacity = 0.5);
      },
      radiusVision: 2.5,
    );
    super.update(dt);
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (attack.value) {
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
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text('GAME OVER  !!!'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text('Reiniciar'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/gamepage');
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Inicio'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ));
        });

    super.die();
  }
}

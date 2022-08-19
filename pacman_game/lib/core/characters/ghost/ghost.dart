import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pacman_game/core/characters/ghost/ghost_game_sprite_sheet.dart';

class Ghost extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement {
  final Vector2 ghostPosition;
  final Vector2 ghostSize;
  ValueNotifier<bool> attackEnemy;
  static final GhostSpriteSheet playerSpriteSheet = GhostSpriteSheet();

  Ghost({
    required this.ghostPosition,
    required this.ghostSize,
    required this.attackEnemy,
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
        collisions: [CollisionArea.rectangle(size: Vector2(18, 18))]));
  }

  @override
  void update(double dt) {
    seePlayer(
        observed: (player) {
          seeAndMoveToPlayer(
            closePlayer: (player) {
              if (!attackEnemy.value) {
                simpleAttackMelee(
                  damage: 1,
                  size: Vector2.all(20),
                  sizePush: 10,
                  withPush: true,
                );
              }
            },
            runOnlyVisibleInScreen: true,
            radiusVision: playerSpriteSheet.pixelSize * 2,
          );
        },
        notObserved: () => runRandomMovement(
              dt,
              speed: 40,
              timeKeepStopped: 00,
              maxDistance: 70,
              minDistance: 20,
            ));

    super.update(dt);
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

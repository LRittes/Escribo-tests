import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/core/characters/ghost_game_sprite_sheet.dart';

class Ghost extends SimpleEnemy with ObjectCollision {
  final Vector2 ghostPosition;
  final Vector2 ghostSize;
  bool _attackEnemy = true;
  static final GhostSpriteSheet playerSpriteSheet = GhostSpriteSheet();

  Ghost({
    required this.ghostPosition,
    required this.ghostSize,
    required bool attackEnemy,
  }) : super(
          position: ghostPosition,
          size: ghostSize,
          animation: SimpleDirectionAnimation(
            idleRight: playerSpriteSheet.ghostidRight,
            runRight: playerSpriteSheet.ghostRunRight,
          ),
          speed: 50,
          life: 1,
        ) {
    setupCollision(CollisionConfig(
        collisions: [CollisionArea.rectangle(size: Vector2(18, 18))]));
    _attackEnemy = attackEnemy;
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        if (_attackEnemy) {
          simpleAttackMelee(
            damage: 1,
            size: Vector2.all(20),
            sizePush: playerSpriteSheet.pixelSize,
            withPush: true,
          );
        }
      },
      runOnlyVisibleInScreen: true,
      radiusVision: playerSpriteSheet.pixelSize * 2,
    );
    super.update(dt);
  }
}

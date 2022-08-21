import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/GamePage/controllers/user_controller.dart';
import 'package:pacman_game/core/characters/ghost/ghost.dart';
import 'package:pacman_game/core/characters/pacman/pacman.dart';
import 'package:pacman_game/core/decorations/fruits/hiper_fruit.dart';
import 'package:pacman_game/core/decorations/fruits/simple_fruit.dart';
import 'package:pacman_game/utils/directions.dart';

class MyGameController extends GameComponent with ChangeNotifier {
  MyGameController._privateConstructor();

  static final MyGameController _singleton =
      MyGameController._privateConstructor();

  factory MyGameController() {
    return _singleton;
  }

  UserController userController = UserController();

  late var playerType = Pacman(
      playerPosition: Vector2(10 * 20, 15 * 20),
      playerSize: Vector2(20, 20),
      attack: attack);
  late Player? player;
  bool attack = false;
  List? fruits;
  List<Ghost>? enemies;
  late bool gameOver;
  String message = 'Game Over !!!';

  void switchAtack() => attack = true;
  void countPoints() => userController.score += 10;
  int get score => userController.score;

  @override
  Future<void>? onLoad() async {
    gameOver = false;
    player = gameRef.player;
    return super.onLoad();
  }

  @override
  void onMount() {
    enemies = [...gameRef.componentsByType<Ghost>()];
    super.onMount();
  }

  @override
  void update(double dt) {
    enemies = [...gameRef.componentsByType<Ghost>()];
    fruits = [
      ...gameRef.componentsByType<SimpleFruit>(),
      ...gameRef.componentsByType<HiperFruit>()
    ];
    if (!player!.isDead) {
      player!.seeComponentType<SimpleFruit>(
        observed: (fruit) {
          fruit.first.removeFromParent();
          userController.incrementScore(10);
        },
        radiusVision: 2.5,
      );
      player!.seeComponentType<HiperFruit>(
        observed: (fruit) {
          fruit.first.removeFromParent();
          gameRef.enemies().forEach((e) => e.opacity = 0.5);
          userController.incrementScore(100);
          attack = true;
        },
        radiusVision: 2.5,
      );
    }
    if (checkInterval('player is dead', 500, dt) &&
        player!.isDead &&
        !gameOver) {
      gameOver = true;
      userController.score = 0;
      _popUp(message);
    }

    enemies!.toList().forEach((enemy) => {
          enemy.seePlayer(
              observed: (player) {
                enemy.seeAndMoveToPlayer(
                  closePlayer: (player) {
                    if (!attack) {
                      enemy.simpleAttackMelee(
                        damage: 1,
                        size: Vector2.all(20),
                        sizePush: 20,
                        withPush: true,
                      );
                    }
                  },
                  runOnlyVisibleInScreen: true,
                  radiusVision: 20 * 2,
                );
              },
              notObserved: () => enemy.runRandomMovement(
                    dt,
                    speed: 40,
                    timeKeepStopped: 00,
                    maxDistance: 70,
                    minDistance: 20,
                  ))
        });

    if (enemies!.isEmpty && !gameOver) {
      gameOver = true;
      message = 'You Win !!!';
      _popUp(message);
    }

    if (fruits!.isEmpty && !gameOver) {
      gameOver = true;
      message = 'You Win !!!';
      _popUp(message);
    }

    super.update(dt);
  }

  void _popUp(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Text(message),
              )),
        );
      },
    );
  }

  void gestureOnScreenHorizontal(DragUpdateDetails di) {
    var sensitivity = 10;
    if (di.delta.dx > sensitivity) {
      playerType.diretion = Directions.right;
    } else if (di.delta.dx < -sensitivity) {
      playerType.diretion = Directions.left;
    }
  }

  void gestureOnScreenVertical(DragUpdateDetails di) {
    var sensitivity = 10;
    if (di.delta.dy > sensitivity) {
      playerType.diretion = Directions.down;
    } else if (di.delta.dy < -sensitivity) {
      playerType.diretion = Directions.up;
    }
  }
}

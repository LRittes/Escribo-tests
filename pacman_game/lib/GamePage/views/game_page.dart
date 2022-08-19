import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';
import 'package:pacman_game/core/characters/pacman/pacman.dart';
import 'package:pacman_game/core/map/map.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  ValueNotifier<bool> attack = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    var player = Pacman(
      playerPosition: Vector2(10 * 20, 15 * 20),
      playerSize: Vector2(20, 20),
      attack: attack,
    );
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails di) {
        var sen = 10;
        if (di.delta.dx > sen) {
          player.diretion = Directions.right;
        } else if (di.delta.dx < -sen) {
          player.diretion = Directions.left;
        }
      },
      onVerticalDragUpdate: (DragUpdateDetails di) {
        var sens = 10;
        if (di.delta.dy > sens) {
          player.diretion = Directions.down;
        } else if (di.delta.dy < -sens) {
          player.diretion = Directions.up;
        }
      },
      child: GameMap(attack: attack, player: player),
    );
  }
}

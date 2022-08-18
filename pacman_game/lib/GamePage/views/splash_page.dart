import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';
import 'package:pacman_game/core/characters/pacman.dart';
import 'package:pacman_game/core/map/map.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var player = Pacman(
      playerPosition: Vector2(10 * 20, 15.7 * 20), playerSize: Vector2(20, 20));
  @override
  Widget build(BuildContext context) {
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
        // print(di);
        if (di.delta.dy > sens) {
          player.diretion = Directions.down;
        } else if (di.delta.dy < -sens) {
          player.diretion = Directions.up;
        }
      },
      child: GameMap(attack: false, player: player),
    );
  }
}

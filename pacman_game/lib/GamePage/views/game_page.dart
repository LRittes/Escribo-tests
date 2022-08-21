import 'package:flutter/material.dart';
import 'package:pacman_game/GamePage/controllers/game_controller.dart';
import 'package:pacman_game/GamePage/controllers/user_controller.dart';
import 'package:pacman_game/GamePage/views/text_score.dart';
import 'package:pacman_game/core/map/game_map.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  MyGameController gameController = MyGameController();
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                userController.user.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
              const TextScore(),
            ],
          ),
        ),
        GestureDetector(
          onHorizontalDragUpdate: (di) =>
              gameController.gestureOnScreenHorizontal(di),
          onVerticalDragUpdate: (di) =>
              gameController.gestureOnScreenVertical(di),
          child: GameMap(
            player: gameController.playerType,
          ),
        ),
      ],
    );
  }
}

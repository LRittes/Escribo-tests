import 'package:flutter/material.dart';
import 'package:pacman_game/GamePage/controllers/game_controller.dart';

class TextScore extends StatefulWidget {
  const TextScore({Key? key}) : super(key: key);

  @override
  State<TextScore> createState() => _TextScoreState();
}

class _TextScoreState extends State<TextScore> {
  var gameController = MyGameController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: gameController,
        builder: (conte, _) => Text(
              '${gameController.score}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ));
  }
}

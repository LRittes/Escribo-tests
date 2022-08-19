import 'package:flutter/material.dart';
import 'package:pacman_game/GamePage/views/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: const Text('Iniciar'),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/gamepage',
          );
        },
      ),
    ));
  }
}

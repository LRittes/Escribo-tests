import 'package:flutter/material.dart';
import 'package:pacman_game/GamePage/views/game_page.dart';
import 'package:pacman_game/GamePage/views/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacman',
      theme: ThemeData.dark(),
      home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/gamepage': (_) => const GamePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

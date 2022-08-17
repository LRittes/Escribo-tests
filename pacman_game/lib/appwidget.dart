import 'package:flutter/material.dart';
import 'package:pacman_game/core/map/map.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameMap(),
      debugShowCheckedModeBanner: false,
    );
  }
}

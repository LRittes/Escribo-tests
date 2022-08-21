import 'package:flutter/material.dart';
import 'package:pacman_game/GamePage/models/user.dart';

class UserController extends ChangeNotifier {
  static final UserController _singleton = UserController._privateConstructor();
  int score = 0;
  String? _name;
  late User user = User(name: _name ?? 'Jogador', score);

  factory UserController() {
    return _singleton;
  }

  UserController._privateConstructor();

  set name(String name) {
    if (name.isEmpty) {
      _name = 'Jogador';
    } else {
      _name = name;
    }
  }

  void incrementScore(int point) {
    score += point;
    notifyListeners();
  }
}

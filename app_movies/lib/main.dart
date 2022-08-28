import 'package:app_movies/app.dart';
import 'package:app_movies/src/modules/home/presenters/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: HomeModule(), child: const MyApp()));
}

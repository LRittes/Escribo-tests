import 'package:app_movies/src/modules/home/presenters/views/components/browser_in_app.dart';
import 'package:flutter/material.dart';

Widget buttonToBrowser(context) {
  return Transform(
    transform: Matrix4.skewX(12),
    origin: const Offset(0, 50),
    child: ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const BrowserInApp(),
          barrierColor: Colors.transparent,
        );
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green[200])),
      child: const Text('Site Oficial', style: TextStyle(fontSize: 15)),
    ),
  );
}

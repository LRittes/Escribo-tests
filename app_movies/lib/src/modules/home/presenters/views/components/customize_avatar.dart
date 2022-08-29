import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

Widget customizeAvatar(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.14),
    color: const Color.fromARGB(255, 36, 40, 46),
    child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: FluttermojiCircleAvatar(
                radius: 50, backgroundColor: Colors.white10)),
        FluttermojiCustomizer(
          scaffoldHeight: MediaQuery.of(context).size.height * 0.5,
        ),
      ],
    ),
  );
}

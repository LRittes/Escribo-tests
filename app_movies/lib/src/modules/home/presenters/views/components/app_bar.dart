import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

PreferredSize appBar(context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
    child: AppBar(
      title: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Site Oficial', style: TextStyle(fontSize: 12)),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: GestureDetector(
            onTap: () {
              showDialog(
                barrierColor: Colors.transparent,
                context: context,
                barrierDismissible: true,
                builder: (c) => Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.14),
                  color: const Color.fromARGB(255, 36, 40, 46),
                  child: Column(
                    children: [
                      FluttermojiCircleAvatar(
                          radius: 35, backgroundColor: Colors.white10),
                      FluttermojiCustomizer(
                        scaffoldHeight:
                            MediaQuery.of(context).size.height * 0.5,
                      ),
                    ],
                  ),
                ),
              );
            },
            child: FluttermojiCircleAvatar(
                radius: 20, backgroundColor: Colors.white10),
          ),
        ),
      ],
      bottom: TabBar(
        indicator: BoxDecoration(
          color: Colors.green[200],
        ),
        padding: const EdgeInsets.all(10),
        tabs: const [
          SizedBox(
            height: 40,
            child: Center(
              child: Text(
                'Filmes',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Center(
              child: Text(
                'Personagens',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Center(
              child: Text(
                'Favoritos',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

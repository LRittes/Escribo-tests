import 'package:app_movies/src/modules/home/presenters/views/components/browser_in_app.dart';
import 'package:app_movies/src/modules/home/presenters/views/components/customize_avatar.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

PreferredSize appBar(context, TabController tabController) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
    child: AppBar(
      title: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
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
                builder: (context) => customizeAvatar(context),
              );
            },
            child: FluttermojiCircleAvatar(
                radius: 20, backgroundColor: Colors.white10),
          ),
        ),
      ],
      bottom: TabBar(
        controller: tabController,
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

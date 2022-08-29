import 'package:app_movies/src/modules/home/presenters/views/components/button_to_browser.dart';
import 'package:app_movies/src/modules/home/presenters/views/components/customize_avatar.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

PreferredSize appBar(context, TabController tabController) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.21),
    child: AppBar(
      title: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: buttonToBrowser(context),
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
                radius: 30, backgroundColor: Colors.white10),
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

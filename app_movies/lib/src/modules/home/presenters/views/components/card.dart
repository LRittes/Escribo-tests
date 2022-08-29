import 'package:app_movies/src/modules/home/presenters/controllers/home_controller.dart';
import 'package:flutter/material.dart';

Widget card(
  context,
  List list,
  int idx,
  bool pageFav,
  bool movie,
  HomeController controler,
) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.1,
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(
        color: !pageFav
            ? Colors.black
            : movie
                ? Colors.red
                : Colors.green,
        width: 2,
      ),
    ),
    child: pageFav
        ? Center(child: Text(list[idx].name))
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(list[idx].name),
              IconButton(
                onPressed: () {
                  controler.exchange(list, idx);
                },
                icon: list[idx].fav
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_outline),
                splashRadius: 1,
                padding: const EdgeInsets.all(1.0),
              )
            ],
          ),
  );
}

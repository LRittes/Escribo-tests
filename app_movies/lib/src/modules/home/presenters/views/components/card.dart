import 'package:flutter/material.dart';

Widget card(context, String name, bool fav, bool pageFav, bool movie) {
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
        ? Center(child: Text(name))
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(name),
              IconButton(
                onPressed: () {},
                icon: fav
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_outline),
                splashRadius: 1,
                padding: const EdgeInsets.all(1.0),
              )
            ],
          ),
  );
}

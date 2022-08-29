import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/presenters/controllers/home_controller.dart';
import 'package:app_movies/src/modules/home/presenters/views/components/card.dart';
import 'package:flutter/material.dart';

Widget tabBarMovies(
  BuildContext context,
  List list,
  bool isLoading,
  HomeController controller,
) {
  var scrollC1 = ScrollController();

  return isLoading
      ? const Center(
          child: CircularProgressIndicator(
          color: Colors.red,
        ))
      : Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollC1,
                itemCount: list.length,
                itemBuilder: (context, idx) {
                  return card(
                    context,
                    list,
                    idx,
                    false,
                    true,
                    controller,
                  );
                },
              ),
            ),
          ],
        );
}

Widget tabBarCharacters(
  BuildContext context,
  List list,
  bool isLoading,
  HomeController controller,
) {
  var scrollC2 = ScrollController();

  return isLoading
      ? const Center(
          child: CircularProgressIndicator(
          color: Colors.red,
        ))
      : Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollC2,
                itemCount: list.length,
                itemBuilder: (context, idx) {
                  return card(
                    context,
                    list,
                    idx,
                    false,
                    true,
                    controller,
                  );
                },
              ),
            ),
          ],
        );
}

Widget tabBarUser(
  BuildContext context,
  List list,
  HomeController controller,
) {
  var scrollC3 = ScrollController();
  return Column(
    children: [
      Expanded(
        child: ListView.builder(
          controller: scrollC3,
          itemCount: list.length,
          itemBuilder: (context, idx) {
            bool isMovie = list[idx] is Movie ? true : false;
            return card(
              context,
              list,
              idx,
              true,
              isMovie,
              controller,
            );
          },
        ),
      ),
    ],
  );
}

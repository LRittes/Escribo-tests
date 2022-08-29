import 'package:app_movies/src/modules/home/domain/entities/movie.dart';
import 'package:app_movies/src/modules/home/presenters/controllers/home_controller.dart';
import 'package:app_movies/src/modules/home/presenters/views/components/app_bar.dart';
import 'package:app_movies/src/modules/home/presenters/views/components/card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final controller = HomeController();
  late final _tabBarController;
  bool isLoadingMovie = true;
  bool isLoadingCharacters = true;
  var scrollC1 = ScrollController();
  var scrollC2 = ScrollController();
  var scrollC3 = ScrollController();

  @override
  void initState() {
    _tabBarController = TabController(vsync: this, length: 3);
    controller.init();
    super.initState();
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, _tabBarController),
      body: body(),
    );
  }

  Widget body() {
    return TabBarView(
      controller: _tabBarController,
      children: [
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            if (controller.listMovies.isNotEmpty) {
              isLoadingMovie = false;
            }

            return tabBarMovies(context, controller.listMovies);
          },
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            if (controller.listCharacters.isNotEmpty) {
              isLoadingCharacters = false;
            }
            return tabBarCharacters(context, controller.listCharacters);
          },
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return tabBarUser(context, controller.listFavs);
          },
        ),
      ],
    );
  }

  Widget tabBarMovies(BuildContext context, List list) {
    return isLoadingMovie
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

  Widget tabBarCharacters(BuildContext context, List list) {
    return isLoadingCharacters
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

  Widget tabBarUser(BuildContext context, List list) {
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
}

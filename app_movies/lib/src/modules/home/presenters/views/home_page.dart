import 'package:app_movies/src/modules/home/presenters/controllers/home_controller.dart';
import 'package:app_movies/src/modules/home/presenters/views/components/app_bar.dart';
import 'package:app_movies/src/modules/home/presenters/views/components/tab_bars.dart';
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

            return tabBarMovies(
              context,
              controller.listMovies,
              isLoadingMovie,
              controller,
            );
          },
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            if (controller.listCharacters.isNotEmpty) {
              isLoadingCharacters = false;
            }
            return tabBarCharacters(
              context,
              controller.listCharacters,
              isLoadingCharacters,
              controller,
            );
          },
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return tabBarUser(context, controller.listFavs, controller);
          },
        ),
      ],
    );
  }
}

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
  bool isLoading = true;
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
            if (controller.listMovies.isNotEmpty) isLoading = false;
            return tabBarMovies(context, controller.listMovies);
          },
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            if (controller.listCharacters.isNotEmpty) isLoading = false;
            return tabBarCharacters(context, controller.listCharacters);
          },
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            if (controller.listCharacters.isNotEmpty) isLoading = false;
            return tabBarUser(context, controller.listFavs);
          },
        ),
      ],
    );
  }

  Widget tabBarMovies(BuildContext context, List list) {
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
                        context, list[idx].name, list[idx].fav, false, true);
                  },
                ),
              ),
            ],
          );
  }

  Widget tabBarCharacters(BuildContext context, List list) {
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
                        context, list[idx].name, list[idx].fav, false, true);
                  },
                ),
              ),
            ],
          );
  }

  Widget tabBarUser(BuildContext context, List list) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.red,
          ))
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollC3,
                  itemCount: list.length,
                  itemBuilder: (context, idx) {
                    return card(
                        context, list[idx].name, list[idx].fav, true, true);
                  },
                ),
              ),
            ],
          );
  }
}

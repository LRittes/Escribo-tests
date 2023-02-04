import 'package:app_movies/src/modules/home/presenters/controllers/home_controller.dart';
import 'package:app_movies/src/modules/home/presenters/states/movie_state.dart';
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
    super.initState();
    _tabBarController = TabController(vsync: this, length: 3);
    controller.init();
    controller.addListener(_listener);
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    controller.removeListener(_listener);
    controller.dispose();
    super.dispose();
  }

  _listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, _tabBarController),
      body: body(),
    );
  }

  Widget body() {
    MovieState state = controller.state;

    Widget widgetMovies = tabBarMovies(
      context,
      [],
      false,
      controller,
      _listener,
    );

    if (state is MovieLoadedState) {
      if (state.movies.isNotEmpty) {
        widgetMovies = tabBarMovies(
          context,
          state.movies,
          false,
          controller,
          _listener,
        );
      }
    }

    if (state is MovieLoadingState) {
      widgetMovies = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(state.message),
          const SizedBox(
            height: 25,
          ),
          const CircularProgressIndicator(),
        ],
      );
    }

    return TabBarView(
      controller: _tabBarController,
      children: [
        widgetMovies,
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
            return tabBarUser(
              context,
              controller.listFavs,
              controller,
            );
          },
        ),
      ],
    );
  }
}

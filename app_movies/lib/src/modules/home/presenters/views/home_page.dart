import 'package:app_movies/src/modules/home/presenters/controllers/home_controller.dart';
import 'package:app_movies/src/modules/home/presenters/views/components/app_bar.dart';
import 'package:app_movies/src/modules/home/presenters/views/components/card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  bool isLoading = true;

  @override
  void initState() {
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar(context),
        body: body(),
      ),
    );
  }

  Widget body() {
    return TabBarView(
      children: [
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            if (controller.listMovies.isNotEmpty) isLoading = false;
            return tabBarMovies(context);
          },
        ),
        Column(),
        Column(),
      ],
    );
  }

  Widget tabBarMovies(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.red,
          ))
        : SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: controller.listMovies.length,
                itemBuilder: (context, idx) {
                  return card(context, controller.listMovies[idx].name,
                      controller.listMovies[idx].fav, false, true);
                },
              ),
            ),
          );
  }
}

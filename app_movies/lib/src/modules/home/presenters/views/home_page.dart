import 'package:app_movies/src/modules/home/presenters/views/components/app_bar.dart';
import 'package:app_movies/src/modules/home/presenters/views/components/card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        Column(
          children: [
            card(context, true, false, false),
          ],
        ),
        Column(
          children: [
            card(context, false, false, false),
          ],
        ),
        Column(
          children: [
            card(context, true, true, false),
            card(context, true, true, true),
          ],
        ),
      ],
    );
  }
}

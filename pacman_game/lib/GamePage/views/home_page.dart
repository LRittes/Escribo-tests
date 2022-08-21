import 'package:flutter/material.dart';
import 'package:pacman_game/GamePage/controllers/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: TextField(
                autofocus: true,
                decoration: const InputDecoration(hintText: 'Name'),
                onChanged: (name) {
                  UserController().name = name;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Iniciar'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/gamepage',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

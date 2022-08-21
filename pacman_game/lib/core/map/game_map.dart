import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/GamePage/controllers/game_controller.dart';
import 'package:pacman_game/core/characters/ghost/ghost.dart';
import 'package:pacman_game/core/characters/pacman/pacman.dart';
import 'package:pacman_game/core/decorations/fruits/hiper_fruit.dart';
import 'package:pacman_game/core/decorations/fruits/simple_fruit.dart';

class GameMap extends StatefulWidget {
  final Pacman player;
  const GameMap({Key? key, required this.player}) : super(key: key);

  @override
  State<GameMap> createState() => _GameMapState();
}

class _GameMapState extends State<GameMap> {
  final double tiledSize = 20;
  MyGameController gameController = MyGameController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.9,
      child: BonfireTiledWidget(
        map: TiledWorldMap(
          'bmap2.tmj',
          objectsBuilder: {
            'ghost': (props) => Ghost(
                  ghostPosition: props.position,
                  ghostSize: props.size,
                ),
            'sf': (props) => SimpleFruit(simpleFruitPosition: props.position),
            'hiper_fruit': (props) =>
                HiperFruit(simpleFruitPosition: props.position),
          },
        ),
        components: [gameController],
        joystick: Joystick(
            keyboardConfig: KeyboardConfig(
                keyboardDirectionalType:
                    KeyboardDirectionalType.wasdAndArrows)),
        cameraConfig: CameraConfig(
          zoom: 1,
        ),
        player: widget.player,
        showCollisionArea: false,
      ),
    );
  }
}

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/core/characters/ghost/ghost.dart';
import 'package:pacman_game/core/characters/pacman/pacman.dart';
import 'package:pacman_game/core/decorations/fruits/hiper_fruit.dart';
import 'package:pacman_game/core/decorations/fruits/simple_fruit.dart';

class GameMap extends StatefulWidget {
  ValueNotifier<bool> attack;
  Pacman player;
  GameMap({Key? key, required this.attack, required this.player})
      : super(key: key);

  @override
  State<GameMap> createState() => _GameMapState();
}

class _GameMapState extends State<GameMap> {
  final double tiledSize = 20;

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'bmap2.tmj',
        objectsBuilder: {
          'ghost': (props) => Ghost(
              ghostPosition: props.position,
              ghostSize: props.size,
              attackEnemy: widget.attack),
          'sf': (props) => SimpleFruit(simpleFruitPosition: props.position),
          'hiper_fruit': (props) =>
              HiperFruit(simpleFruitPosition: props.position),
        },
      ),
      joystick: Joystick(
          keyboardConfig: KeyboardConfig(
              keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows)),
      cameraConfig: CameraConfig(
        zoom: 0.8,
        // moveOnlyMapArea: true,
        // sizeMovementWindow: Vector2(
        //   MediaQuery.of(context).size.width,
        //   MediaQuery.of(context).size.height,
        // ),
      ),
      player: widget.player,
      showCollisionArea: false,
    );
  }
}

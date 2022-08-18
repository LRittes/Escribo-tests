import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/core/characters/ghost.dart';
import 'package:pacman_game/core/characters/pacman.dart';

class GameMap extends StatelessWidget {
  bool attack;
  GameMap({Key? key, required this.attack}) : super(key: key);

  final double pixel = 20;

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'bmap.tmj',
      ),
      components: [
        Ghost(
          ghostPosition: Vector2(4.8 * pixel, 5 * pixel),
          ghostSize: Vector2.all(pixel),
          attackEnemy: attack,
        ),
        Ghost(
          ghostPosition: Vector2(15 * pixel, 5 * pixel),
          ghostSize: Vector2.all(pixel),
          attackEnemy: attack,
        ),
        Ghost(
          ghostPosition: Vector2(4.8 * pixel, 19.7 * pixel),
          ghostSize: Vector2.all(pixel),
          attackEnemy: attack,
        ),
        Ghost(
          ghostPosition: Vector2(15 * pixel, 19.7 * pixel),
          ghostSize: Vector2.all(pixel),
          attackEnemy: attack,
        ),
      ],
      joystick: Joystick(keyboardConfig: KeyboardConfig()
          // directional:
          //  JoystickDirectional(),
          ),
      cameraConfig: CameraConfig(
        zoom: 0.8,
        moveOnlyMapArea: true,
        sizeMovementWindow: Vector2(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
      ),
      player: Pacman(
          playerPosition: Vector2(10 * pixel, 15.7 * pixel),
          playerSize: Vector2(pixel, pixel)),
      showCollisionArea: false,
    );
  }
}

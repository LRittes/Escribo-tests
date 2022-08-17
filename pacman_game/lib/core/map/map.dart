import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/core/characters/pacman.dart';

class GameMap extends StatelessWidget {
  const GameMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'bmap.tmj',
      ),
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      cameraConfig: CameraConfig(
        zoom: 1,
        moveOnlyMapArea: true,
      ),
      player:
          Pacman(position: Vector2(10 * 20, 15.7 * 20), size: Vector2(20, 20)),
      showCollisionArea: true,
    );
  }
}

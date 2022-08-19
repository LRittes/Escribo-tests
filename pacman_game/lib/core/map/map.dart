import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/core/characters/ghost/ghost.dart';
import 'package:pacman_game/core/characters/pacman/pacman.dart';
import 'package:pacman_game/core/decorations/fruits/fruit_list.dart';

class GameMap extends StatefulWidget {
  bool attack;
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
        'bmap.tmj',
      ),
      gameController: GameController(),
      components: [
        Ghost(
          ghostPosition: Vector2(4.8 * tiledSize, 5 * tiledSize),
          ghostSize: Vector2.all(tiledSize),
          attackEnemy: widget.attack,
        ),
        Ghost(
          ghostPosition: Vector2(15 * tiledSize, 5 * tiledSize),
          ghostSize: Vector2.all(tiledSize),
          attackEnemy: widget.attack,
        ),
        Ghost(
          ghostPosition: Vector2(4.8 * tiledSize, 19.7 * tiledSize),
          ghostSize: Vector2.all(tiledSize),
          attackEnemy: widget.attack,
        ),
        Ghost(
          ghostPosition: Vector2(15 * tiledSize, 19.7 * tiledSize),
          ghostSize: Vector2.all(tiledSize),
          attackEnemy: widget.attack,
        ),
        ...listSimpleFruit
      ],
      joystick: JoystickMoveToPosition(
          // Joystick(
          // keyboardConfig: KeyboardConfig(
          //   keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          // ),
          ),
      cameraConfig: CameraConfig(
        zoom: 1,
        moveOnlyMapArea: true,
        sizeMovementWindow: Vector2(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
      ),
      player: widget.player,
      showCollisionArea: false,
    );
  }
}

import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/core/decorations/fruits/simple_fruit.dart';
import 'package:pacman_game/utils/fn_list_filtred.dart';

var listSimpleFruit = [
  ...myListFiltered(row0, [8, 9]),
  ...myListFiltered(row1, [1, 2, 4, 5, 6, 8, 9, 11, 12, 14, 15, 16]),
  ...myListFiltered(row2, [1, 2, 4, 5, 6, 8, 9, 11, 12, 14, 15, 16]),
  ...myListFiltered(row3, []),
  ...myListFiltered(row4, [1, 2, 4, 6, 7, 8, 9, 10, 12, 14, 15, 16]),
  ...myListFiltered(row5, [4, 8, 12]),
  ...myListFiltered(row6, [0, 1, 2, 4, 5, 6, 8, 10, 11, 12, 14, 15, 16, 17]),
  ...myListFiltered(row7, [0, 1, 2, 4, 14, 15, 16, 17]),
  ...myListFiltered(row8, [0, 1, 2, 4, 6, 7, 8, 9, 10, 12, 14, 15, 16, 17]),
  ...myListFiltered(row9, [6, 7, 8, 9, 10]),
  ...myListFiltered(row10, [0, 1, 2, 4, 6, 7, 8, 9, 10, 14, 15, 16, 17]),
  ...myListFiltered(row11, [0, 1, 2, 4, 12, 14, 15, 16, 17]),
  ...myListFiltered(row12, [0, 1, 2, 4, 6, 7, 8, 9, 10, 12, 14, 15, 16, 17]),
  ...myListFiltered(row13, [8]),
  ...myListFiltered(row14, [1, 2, 4, 5, 6, 8, 10, 11, 12, 14, 15, 16]),
  ...myListFiltered(row15, [2, 14]),
  ...myListFiltered(row16, [0, 2, 4, 6, 7, 8, 9, 10, 12, 14, 16, 17]),
  ...myListFiltered(row17, [4, 8, 12]),
  ...myListFiltered(row18, [1, 2, 3, 4, 5, 6, 8, 10, 11, 12, 13, 14, 15, 16]),
  ...myListFiltered(row19, []),
];

var listX =
    List<double>.generate(18, (index) => 20.2 * index + 26, growable: true);

var listY =
    List<double>.generate(20, (index) => 20 * index + 8, growable: true);

var row0 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[0]),
  );
}, growable: true);

var row1 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[1]),
  );
}, growable: true);

var row2 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[2]),
  );
}, growable: true);

var row3 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[3]),
  );
}, growable: true);

var row4 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[4]),
  );
}, growable: true);

var row5 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[5]),
  );
}, growable: true);

var row6 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[6]),
  );
}, growable: true);

var row7 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[7]),
  );
}, growable: true);

var row8 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[8]),
  );
}, growable: true);

var row9 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[9]),
  );
}, growable: true);

var row10 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[10]),
  );
}, growable: true);

var row11 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[11]),
  );
}, growable: true);

var row12 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[12]),
  );
}, growable: true);

var row13 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[13]),
  );
}, growable: true);

var row14 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[14]),
  );
}, growable: true);

var row15 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[15]),
  );
}, growable: true);

var row16 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[16]),
  );
}, growable: true);

var row17 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[17]),
  );
}, growable: true);

var row18 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[18]),
  );
}, growable: true);

var row19 = List.generate(18, (i) {
  return SimpleFruit(
    simpleFruitPosition: Vector2(listX[i], listY[19]),
  );
}, growable: true);

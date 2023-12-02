// ignore_for_file: constant_identifier_names
import 'dart:convert';
import 'dart:io';

const MAX_RED_CUBES = 12;
const MAX_GREEN_CUBES = 13;
const MAX_BLUE_CUBES = 14;

class GameSet {
  final int redCubes;
  final int greenCubes;
  final int blueCubes;

  const GameSet._({
    required this.redCubes,
    required this.greenCubes,
    required this.blueCubes,
  });

  bool isValid() =>
      redCubes <= MAX_RED_CUBES &&
      greenCubes <= MAX_GREEN_CUBES &&
      blueCubes <= MAX_BLUE_CUBES;

  static GameSet fromString(String input) {
    int redCubes = 0;
    int greenCubes = 0;
    int blueCubes = 0;

    final cubes = input.replaceAll(" ", "").split(",");

    for (var cube in cubes) {
      if (cube.contains("red")) {
        redCubes += int.parse(cube.replaceAll(RegExp(r'[^0-9]'), ""));
      }
      if (cube.contains("green")) {
        greenCubes += int.parse(cube.replaceAll(RegExp(r'[^0-9]'), ""));
      }
      if (cube.contains("blue")) {
        blueCubes += int.parse(cube.replaceAll(RegExp(r'[^0-9]'), ""));
      }
    }

    return GameSet._(
      redCubes: redCubes,
      greenCubes: greenCubes,
      blueCubes: blueCubes,
    );
  }
}

class Game {
  final int id;
  final List<GameSet> sets;

  const Game._({
    required this.id,
    required this.sets,
  });

  bool isValid() {
    for (var set in sets) {
      if (!set.isValid()) return false;
    }
    return true;
  }

  @override
  String toString() {
    String string = "Game $id: ";
    string += sets
        .map((e) =>
            "${e.redCubes} red, ${e.greenCubes} green, ${e.blueCubes} blue")
        .join(";");
    return string;
  }

  static Game fromString(String input) {
    final gameId = input.split(":").first.replaceAll(RegExp(r'[^0-9]'), "");
    final sets =
        input.split(":").last.split(";").map(GameSet.fromString).toList();

    return Game._(
      id: int.parse(gameId),
      sets: sets,
    );
  }
}

Future<int> day2(String inputFilePath) async {
  final input = File(inputFilePath);
  final lines = await input
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .toList();

  final games = lines.map((game) => Game.fromString(game));

  int result = 0;
  for (var game in games) {
    if (game.isValid()) result += game.id;
  }

  return result;
}

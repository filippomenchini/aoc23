// ignore_for_file: constant_identifier_names
import 'package:aoc23/src/commons/get_file_lines.dart';

const DOT = ".";
const COG = "*";

Future<int> day3Part1(String inputFilePath) async {
  final lines = await getFileLines(inputFilePath);

  int result = 0;
  for (var i = 0; i < lines.length; i++) {
    String number = "";
    bool isPartNumber = false;
    for (var j = 0; j < lines[i].length; j++) {
      int? currentCharacter = int.tryParse(lines[i][j]);
      if (currentCharacter == null || j == lines[i].length - 1) {
        if (isPartNumber) {
          result += int.parse(
              currentCharacter != null ? "$number$currentCharacter" : number);
          isPartNumber = false;
        }
        number = "";
        continue;
      }
      number += "$currentCharacter";

      // Looking for symbol on top of the current character.
      if (i > 0) {
        String char = lines[i - 1][j];
        if (char != DOT && int.tryParse(char) == null) {
          isPartNumber = true;
        }
      }

      // Looking for symbol under the current character.
      if (i < lines.length - 1) {
        String char = lines[i + 1][j];
        if (char != DOT && int.tryParse(char) == null) {
          isPartNumber = true;
          continue;
        }
      }

      // Looking for symbol left of the current character.
      if (j > 0) {
        String char = lines[i][j - 1];
        if (char != DOT && int.tryParse(char) == null) {
          isPartNumber = true;
          continue;
        }
      }

      // Looking for symbol right of the current character.
      if (j < lines[i].length - 1) {
        String char = lines[i][j + 1];
        if (char != DOT && int.tryParse(char) == null) {
          isPartNumber = true;
          continue;
        }
      }

      // Looking for symbol top-left of the current character.
      if (i > 0 && j > 0) {
        String char = lines[i - 1][j - 1];
        if (char != DOT && int.tryParse(char) == null) {
          isPartNumber = true;
          continue;
        }
      }

      // Looking for symbol top-right of the current character.
      if (i > 0 && j < lines[i].length - 1) {
        String char = lines[i - 1][j + 1];
        if (char != DOT && int.tryParse(char) == null) {
          isPartNumber = true;
          continue;
        }
      }

      // Looking for symbol bottom-left of the current character.
      if (i < lines.length - 1 && j > 0) {
        String char = lines[i + 1][j - 1];
        if (char != DOT && int.tryParse(char) == null) {
          isPartNumber = true;
          continue;
        }
      }

      // Looking for symbol bottom-right of the current character.
      if (i < lines.length - 1 && j < lines[i].length - 1) {
        String char = lines[i + 1][j + 1];
        if (char != DOT && int.tryParse(char) == null) {
          isPartNumber = true;
          continue;
        }
      }
    }
  }

  return result;
}

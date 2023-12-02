import 'package:aoc23/aoc23.dart';
import 'package:test/test.dart';

void main() {
  group('Day 2', () {
    test('Part 1', () async {
      // Arrange
      final inputFilePath = 'test_resources/day_2/input.txt';

      // Act
      final result = await day2Part1(inputFilePath);
      print("\tDay 2 - Part 1 result: $result");
    });

    test('Part 2', () async {
      // Arrange
      final inputFilePath = 'test_resources/day_2/input.txt';

      // Act
      final result = await day2Part2(inputFilePath);
      print("\tDay 2 - Part 2 result: $result");
    });
  });
}

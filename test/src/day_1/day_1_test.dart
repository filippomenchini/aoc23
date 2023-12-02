import 'package:aoc23/aoc23.dart';
import 'package:test/test.dart';

void main() {
  group('Day 1', () {
    test('Part 1', () async {
      // Arrange
      final inputFilePath = 'test_resources/day_1/input.txt';

      // Act
      final result = await day1Part1(inputFilePath);
      print("\tDay 1 - Part 1 result: $result");
    });

    test('Part 2', () async {
      // Arrange
      final inputFilePath = 'test_resources/day_1/input.txt';

      // Act
      final result = await day1Part2(inputFilePath);
      print("\tDay 1 - Part 2 result: $result");
    });
  });
}

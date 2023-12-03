import 'package:aoc23/src/day_3/day_3.dart';
import 'package:test/test.dart';

void main() {
  group('Day 3', () {
    test('Part 1', () async {
      // Arrange
      final inputFilePath = 'test_resources/day_3/input.txt';

      // Act
      final result = await day3Part1(inputFilePath);
      print("\tDay 3 - Part 1 result: $result");
    });

    test('Part 2', () async {});
  });
}

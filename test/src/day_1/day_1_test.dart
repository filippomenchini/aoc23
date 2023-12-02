import 'package:aoc23/aoc23.dart';
import 'package:test/test.dart';

void main() {
  test('Day 1', () async {
    // Arrange
    final inputFilePath = 'test_resources/day_1/input.txt';

    // Act
    final result = await day1(inputFilePath);
    print("\tDay 1 result: $result");
  });
}

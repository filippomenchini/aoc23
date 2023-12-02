import 'package:aoc23/aoc23.dart';
import 'package:test/test.dart';

void main() {
  test('Day 2', () async {
    // Arrange
    final inputFilePath = 'test_resources/day_2/input.txt';

    // Act
    final result = await day2(inputFilePath);
    print("\tDay 2 result: $result");
  });
}

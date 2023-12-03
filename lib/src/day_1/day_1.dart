import 'package:aoc23/src/commons/get_file_lines.dart';

const numbersInStrings = {
  'one': '1',
  'two': '2',
  'three': '3',
  'four': '4',
  'five': '5',
  'six': '6',
  'seven': '7',
  'eight': '8',
  'nine': '9',
};

Future<int> day1Part1(String inputFilePath) async {
  final lines = await getFileLines(inputFilePath);

  final result = lines
      .map((line) => line.replaceAll(RegExp(r'[^0-9]'), ""))
      .map((stringNumber) => int.parse(
          "${stringNumber[0]}${stringNumber[stringNumber.length - 1]}"))
      .reduce((value, element) => value += element);

  return result;
}

Future<int> day1Part2(String inputFilePath) async {
  final lines = await getFileLines(inputFilePath);

  final result = lines
      .map(stringToNumber)
      .map((stringNumber) => int.parse(
          "${stringNumber[0]}${stringNumber[stringNumber.length - 1]}"))
      .reduce((value, element) => value += element);

  return result;
}

String stringToNumber(String input) {
  String result = "";
  String currentNumber = "";
  for (var rune in input.runes) {
    String char = String.fromCharCode(rune);
    if (int.tryParse(char) != null) {
      result += char;
      currentNumber = "";
      continue;
    }
    currentNumber += char;
    if (currentNumber.contains("one")) {
      result += "1";
      currentNumber = char;
    } else if (currentNumber.contains("two")) {
      result += "2";
      currentNumber = char;
    } else if (currentNumber.contains("three")) {
      result += "3";
      currentNumber = char;
    } else if (currentNumber.contains("four")) {
      result += "4";
      currentNumber = char;
    } else if (currentNumber.contains("five")) {
      result += "5";
      currentNumber = char;
    } else if (currentNumber.contains("six")) {
      result += "6";
      currentNumber = char;
    } else if (currentNumber.contains("seven")) {
      result += "7";
      currentNumber = char;
    } else if (currentNumber.contains("eight")) {
      result += "8";
      currentNumber = char;
    } else if (currentNumber.contains("nine")) {
      result += "9";
      currentNumber = char;
    }
  }

  return result;
}

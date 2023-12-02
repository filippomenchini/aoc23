import 'dart:convert';
import 'dart:io';

Future<int> day1(String inputFilePath) async {
  final input = File(inputFilePath);
  final lines = await input
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .toList();
  final result = lines
      .map((line) => line.replaceAll(RegExp(r'[^0-9]'), ""))
      .map((stringNumber) => int.parse(
          "${stringNumber[0]}${stringNumber[stringNumber.length - 1]}"))
      .reduce((value, element) => value += element);

  return result;
}

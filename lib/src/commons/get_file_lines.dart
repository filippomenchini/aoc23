import 'dart:convert';
import 'dart:io';

Future<List<String>> getFileLines(String inputPath) async {
  final input = File(inputPath);
  final lines = await input
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .toList();

  return lines;
}

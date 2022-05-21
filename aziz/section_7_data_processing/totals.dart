import 'dart:convert';
import 'dart:io';
import "package:path/path.dart" show dirname;

Future<void> main(List<String> arg) async {
  // var userInput = stdin.readLineSync();
  const inputFile = "inputFile.csv";
  if (inputFile.isEmpty) {
    print('Usage: <inputFile.csv');
    exit(1);
  }

  var path = '${dirname(Platform.script.path)}/$inputFile';

  final List<String> lines = File(path).readAsLinesSync();
  lines.removeAt(0);

  final totalDurationByTag = <String, double>{};
  for (var line in lines) {
    final values = line.split(',');

    final String duration = values[3].replaceAll('"', '');

    final double durationNum = double.parse(duration);

    final tag = values[5].replaceAll('"', '');
    final previousTotal = totalDurationByTag[tag];
    if (previousTotal == null) {
      totalDurationByTag[tag] = durationNum;
    } else {
      totalDurationByTag[tag] = previousTotal + durationNum;
    }
  }

  for (var entry in totalDurationByTag.entries) {
    var formattedDuration = entry.value.round();
    var tag = entry.key == '' ? 'Unallocated' : entry.key;
    print('${tag}: ${formattedDuration}');
  }

  // await readFiles();
}

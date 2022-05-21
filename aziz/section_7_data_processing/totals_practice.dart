import 'dart:io';
import 'package:path/path.dart' show dirname;

void main() {
  // import 'dart:io';
  // import 'package:path/path.dart' show dirname;

  var inputFile = "inputFile.csv";
  var path = '${dirname(Platform.script.path)}/$inputFile';

  final List<String> lines = File(path).readAsLinesSync();
  lines.removeAt(0);
}

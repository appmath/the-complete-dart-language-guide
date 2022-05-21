///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
//
// https://dart.dev/articles/libraries/creating-streams

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' show dirname;

const list = [1, 2, 3, 4, 5];

/// Splits a stream of consecutive strings into lines.
///
/// The input string is provided in smaller chunks through
/// the 'source' stream.
Stream<String> lines(Stream<String> source) async* {
  var partial = '';
  // Wait until a new chunk is available, then process it.
  await for (var chunk in source) {
    var lines = chunk.split('\n');
    lines[0] = partial + lines[0];
    partial = lines.removeLast();
    for (var line in lines) {
      yield line;
    }
  }
  // Add final partial line to output stream, if any
  if (partial.isNotEmpty) yield partial;
}

Stream<String> convertToStream(String str) async* {
  for (var i = 0; i < str.length; i++) {
    yield str[i];
  }
}

Future<void> addString(Stream stream) async {
  print('addString');
  String result = '';
  await for (var str in stream) {
    result = result + str;
  }
  print('result: $result');
}

Stream<int> timedCounterExample(Duration interval, [int? maxCount]) async* {
  print('maxCount: $maxCount');

  int i = 0;
  while (true) {
    await Future.delayed(interval);
    yield i++;
    if (i == maxCount) break;
  }
}

Future<void> streamTransformerExample() async {
  var inputFile = "input.txt";
  var path = '${dirname(Platform.script.path)}/$inputFile';

  final Stream<List<int>> content = File(path).openRead();
  final List<String> inputLines = await content
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .toList();
  print('InputLines:');
  inputLines.forEach(print);
}

void mapAlternativeExample() {
  print('mapAlternativeExample');
  Stream.fromIterable(list)
      .where((int x) => x.isEven)
      .expand((var x) => [x, x, x])
      .take(5)
      .forEach(print);
}

void counterStreamExample() {
  print('counterStreamExample:');
  final counterStream =
      Stream.periodic(const Duration(seconds: 1), (x) => x).take(5);
  counterStream.forEach(print);
}

void doubleCounterStreamExample() {
  print('doubleCounterStreamExample');
  final doubleCounterStream = Stream.fromIterable(list).map((x) => x * 2);
  doubleCounterStream.forEach(print);
}

const String str =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
Future<void> main() async {
  // await addString(lines(convertToStream(str)));
  // counterStreamExample();
  // doubleCounterStreamExample();
  // mapAlternativeExample();
  // await streamTransformerExample();
  // timedCounterExample(const Duration(seconds: 1), 5).forEach(print);

  // ====  STREAMCONTROLLER
  // var counterStream = timedCounter(const Duration(seconds: 1), 15);
  // counterStream.listen(print);

  // listenAfterDelay();
  goodListenWithPause();
}

/// STREAMCONTROLLER

void goodListenWithPause() {
  var counterStream = timedCounterGood(const Duration(seconds: 1), 15);
  late StreamSubscription<int> subscription;

  subscription = counterStream.listen((int counter) {
    print('counter: $counter');
    if (counter == 5) {
      // After 5 ticks, pause for five seconds, then resume.
      subscription.pause(Future.delayed(const Duration(seconds: 5)));
    }
  });
}

void badListenWithPause() {
  var counterStream = timedCounterBad(const Duration(seconds: 1), 15);
  late StreamSubscription<int> subscription;

  subscription = counterStream.listen((int counter) {
    print('counter: $counter');
    if (counter == 5) {
      // After 5 ticks, pause for five seconds, then resume.
      subscription.pause(Future.delayed(const Duration(seconds: 5)));
    }
  });
}

void listenAfterDelay() async {
  var counterStream = timedCounterBad(const Duration(seconds: 1), 15);
  await Future.delayed(const Duration(seconds: 5));

  // After 5 seconds, add a listener.
  await for (final n in counterStream) {
    print(n); // Print an integer every second, 15 times.
  }
}

// NOTE: This implementation is FLAWED!
// It starts before it has subscribers, and it doesn't implement pause.
Stream<int> timedCounterBad(Duration interval, [int? maxCount]) {
  var controller = StreamController<int>();
  int counter = 0;
  void tick(Timer timer) {
    print('tick');
    counter++;
    controller.add(counter); // Ask stream to send counter values as event.
    if (maxCount != null && counter >= maxCount) {
      timer.cancel();
      controller.close(); // Ask stream to shut down and tell listeners.
    }
  }

  Timer.periodic(interval, tick); // BAD: Starts before it has subscribers.
  return controller.stream;
}

Stream<int> timedCounterGood(Duration interval, [int? maxCount]) {
  late StreamController<int> controller;
  Timer? timer;
  int counter = 0;

  void tick(_) {
    print('tick');
    counter++;
    controller.add(counter);
    if (counter == maxCount) {
      timer?.cancel();
      controller.close();
    }
  }

  void startTimer() {
    timer = Timer.periodic(interval, tick);
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  controller = StreamController<int>(
      onListen: startTimer,
      onPause: stopTimer,
      onResume: startTimer,
      onCancel: stopTimer);

  return controller.stream;
}

///
///
/// STREAMCONTROLLER
///

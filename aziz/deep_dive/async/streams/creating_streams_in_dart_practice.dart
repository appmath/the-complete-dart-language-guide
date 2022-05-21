import 'creating_streams_in_dart.dart';

void main() async {
  timedCounterExample(Duration(seconds: 1), 3).forEach(print);
  print('-------');
  timedCounterExample2(Duration(seconds: 1), 3).forEach(print);
}

Stream<int> timedCounterExample(Duration interval, maxCount) async* {
  for (var i = 0; i <= maxCount; i++) {
    Future.delayed(interval);
    yield i;
  }
}

Stream<int> timedCounterExample2(Duration interval, [int? maxCount]) async* {
  print('maxCount: $maxCount');

  int i = 0;
  while (true) {
    await Future.delayed(interval);
    yield i++;
    if (i == maxCount) break;
  }
}

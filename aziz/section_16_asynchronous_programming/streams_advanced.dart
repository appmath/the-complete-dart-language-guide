Future<void> main() async {
  // Stream.value(10);
  // Stream.error(Exception('something went wrong'));
  // Stream.empty();
  // Stream.fromFuture(Future.delayed(Duration(seconds: 1), () => 42));
  // Stream.periodic(Duration(seconds: 1), (index) => index).forEach((element) {
  //   print(element);
  // });

  var stream = Stream.fromIterable([1, 2, 3]);

  // final value = await stream.first;
  // print('value: $value');

  // final doubles = await stream
  //     .map((value) => value * 5)
  //     .where((value) => value > 10)
  //     .toList();
  // print('doubles: $doubles');
  //
  // stream = Stream.fromIterable([1, 2, 3]);
  //
  // final fold = await stream
  //     .map((value) => value * 5)
  //     .fold(0, (int previous, int element) => previous + element);
  //
  // print('fold: $fold');

  final list = ['a', 'bb', 'ccc'];
  print('----- reduce -----');
  final reduce = list.reduce((value, element) {
    print('value: $value ,  element: $element');

    return value + element;
  });
  print('----- reduce result: $reduce\n');

  print('----- fold -----');
  final fold = list.fold(0, (int value, String element) {
    print('value: $value ,  element: $element');
    return value + element.length;
  });
  print('-----fold result: $fold');

  var join = list.join('--');
  print('join: $join');
}

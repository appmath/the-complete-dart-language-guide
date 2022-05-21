import 'dart:async';

///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
// https://zaiste.net/programming/dart/howtos/howto-create-stream-transformer-dart/
//

void main() {
  final StreamTransformer<int, int> tripler =
      StreamTransformer<int, int>.fromHandlers(handleData: (data, sink) {
    sink.add(data * 3);
  });

  final controller = StreamController<int>();
  controller.stream.transform(tripler).listen((event) {
    print('tripled: $event');
  });

  controller.add(20);
  controller.add(1);
}

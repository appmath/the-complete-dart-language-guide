///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
//
// https://www.udemy.com/course/dart-and-flutter-the-complete-developers-guide/learn/lecture/10874912#overview
// SECTION 12 (Grider's course)

import 'dart:async';

class Cake {
  final String type;

  Cake({required this.type});

  @override
  String toString() {
    return 'Cake{$type}';
  }
}

class Order {
  String type;
  Order(this.type);
}

Future<void> main() async {
  final controller = StreamController();
  // final order = Order('banana');
  final order = Order('chocolate');

  final baker = StreamTransformer.fromHandlers(handleData: handleData);

  controller.sink.add(order);
  controller.stream
      .map((order) => order.type)
      .transform(
        baker,
      )
      .listen((cake) {
    print('Here is your $cake');
  }).onError((error) => {print('error: $error')});
}

void handleData(cakeType, EventSink sink) {
  if (cakeType == 'chocolate') {
    sink.add(Cake(type: 'Chocolate'));
  } else {
    sink.addError('I can\'t bake that type');
  }
}

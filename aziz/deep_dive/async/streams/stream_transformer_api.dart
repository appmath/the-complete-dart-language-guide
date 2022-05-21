import 'dart:async';

///////////////////////////////////////////////////////

////////////////// OFFICIAL API DOC //////////////////

///////////////////////////////////////////////////////
//
// https://api.flutter.dev/flutter/dart-async/StreamTransformer/StreamTransformer.fromHandlers.html

const names = ['john', 'aziz', 'saad'];

void main() {
  final stringStream = Stream.fromIterable(names);
  stringStream.transform(StreamTransformer<String, String>.fromHandlers(
      handleData: (String value, EventSink<String> sink) {
    sink.add(value);
    sink.add(value);
  }));

  StreamController<String> controller = StreamController.broadcast();
  controller.onListen = () {
    scheduleMicrotask(() {
      controller.addError("Bad");
      controller.addError("Worse");
      controller.addError("Worst");
    });
  };
  var sharedState = 0;
  var transformedStream = controller.stream.transform(
      StreamTransformer<String, String>.fromHandlers(
          handleError: (error, stackTrace, sink) {
    sharedState++; // Increment shared error-counter.
    sink.add("Error $sharedState: $error");
  }));

  transformedStream.listen(print);
  // transformedStream.listen(print);
}

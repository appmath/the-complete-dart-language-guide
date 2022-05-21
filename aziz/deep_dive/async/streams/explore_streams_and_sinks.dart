///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
//
// https://medium.flutterdevs.com/explore-streams-and-sinks-in-dart-flutter-abd553bc9f99

import 'dart:async';

import '../../../section_12_classes_advanced/exception_exploration.dart';

void basicStuff() {
  final controller = StreamController<String>();
  final subscription = controller.stream.listen((String info) {
    print(info);
  }, onError: (error) => print('error: $error'));

  controller.sink.add("Information");
  controller.sink.add("Cars");
  controller.addError(InputException(cause: 'Kaboom'));
}

//Rent house list
const _houseList = {
  "2Bhk": 2,
  "3Bhk": 3,
  "4Bhk": 4,
  "5Bhk": 2,
};

//Different house images
const _houseImages = {
  "2Bhk": "https://q-xx.bstatic.com/images/hotel/max1024x768/143/143884328.jpg",
  "3Bhk": "https://cf.bstatic.com/images/hotel/max1024x768/290/290745879.jpg",
  "4Bhk":
      "https://www.cascadebuildtech.com/wp-content/uploads/2019/11/Living-room-Affinity-Greens-2bhk-3bhk-4bhk-Premium-Flats-in-Zirakpur-Cascade-buildtech.jpg",
  "5Bhk":
      "https://lh3.googleusercontent.com/proxy/EH9Kr_VLno906ZCz5t-IImVT-daHShoWtcBbaKVtCpJ4NUbp6SHO5T3wJ9SVpc24tQAnEaFdwOGdvpKizeuFF4erJYKDxXAnEc9FUzFD9ZQmfXZEe1520kH9oE2sHu7J1QaGaVo"
};

class MyInformationService {
  final _onNewInformation = StreamController<String>();
  Stream<String> get onNewInfo => _onNewInformation.stream;
  StreamSink<String> get sink => _onNewInformation.sink;
  void add(data) {
    _onNewInformation.sink.add(data);
  }

  void dispose() {
    _onNewInformation.close();
  }
}

void main() {
  // basicStuff();

  final service = MyInformationService();

  service.onNewInfo.listen(
    (String info) => print('info: $info'),
    onError: (error) => print('error: $error'),
    onDone: () => print('Done!'),
  );
  service.add('Hello');
}

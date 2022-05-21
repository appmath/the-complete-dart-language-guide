import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' as http;

void main() {
  final rawJson = '{"url": "http://blah.jpg", "id": 1}';

  var parsedJson = jsonDecode(rawJson);
  var imageModel = ImageModel.fromJson(parsedJson: parsedJson);
  print("parsedJson[id]: $imageModel");
}

class ImageModel {
  int id;
  String url;

  ImageModel.fromJson({required parsedJson})
      : id = parsedJson['id'],
        url = parsedJson['url'];

  @override
  String toString() {
    return 'ImageModel{id: $id, url: $url}';
  }
}

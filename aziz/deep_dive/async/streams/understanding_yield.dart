///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
//
// https://medium.com/@dumazy/create-a-stream-that-requires-a-future-in-dart-692f6f089a7e

Stream<String> getWordStream() async* {
  for (int index = 0; index < words.length; index++) {
    final word = await fetchWord(index);
    yield word;
  }
}

// Fetch a word with 1 second delay
Future<String> fetchWord(int index) {
  return Future.delayed(const Duration(seconds: 1), () => words[index]);
}

const words = [
  "House",
  "Car",
  "Beach",
  "Sky",
  "Desk",
];

Stream<String> getUpperCaseStream() async* {
  yield* getWordStream().map((word) => word.toUpperCase());
}

void main() {
  // getWordStream().forEach(print);
  getUpperCaseStream().forEach(print);
}

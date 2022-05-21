Future<void> main() async {
  var stream = Stream.fromIterable([1, 2, 3]);

  final doubledEvens =
      stream.map((value) => value * 2).where((value) => value.isEven);
  final list = await doubledEvens.toList();
  list.forEach(print);
}

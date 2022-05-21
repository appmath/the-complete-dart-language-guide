void main() {
  const intList = [1, 2, 3];
  const doubleList = [1.0, 2.0, 3.0];

  // TODO Revisit
  intList.forEach(print);

  final List<int> doubles = intList.map((value) => value * 2).toList();
  print('doubles: $doubles');

  final doublesFor = doubleItems(intList);
  print('doublesFor: $doublesFor');

  final triples = transform(intList, (item) => item * 3);
  print('triples: $triples');

  final squares = transform(intList, (item) => item * item);
  print('squares: $squares');

  final squaresG = transformG<double>(doubleList, (item) => item * item);
  print('squaresG: $squaresG');

  final squaresExtraG =
      transformExtraG<double, double>(doubleList, (item) => item * item);
  print('squaresExtraG: $squaresExtraG');

  final squaresExtraGMixed =
      transformExtraG<double, int>(doubleList, (item) => (item * item).round());
  print('squaresExtraGMixed: $squaresExtraGMixed');
}

List<int> doubleItems(List<int> items) {
  var result = <int>[];
  for (var x in items) {
    result.add(x * 2);
  }
  return result;
}

List<int> transform(List<int> items, int Function(int) f) {
  var result = <int>[];
  for (var x in items) {
    result.add(f(x));
  }
  return result;
}

List<T> transformG<T>(List<T> items, T Function(T) f) {
  List<T> result = [];
  for (var item in items) {
    result.add(f(item));
  }
  return result;
}

List<R> transformExtraG<T, R>(List<T> items, R Function(T) f) {
  List<R> result = [];
  for (var item in items) {
    result.add(f(item));
  }
  return result;
}

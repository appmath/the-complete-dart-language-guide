void main() {
  const list = [1, 2, 3];
  const list2 = [1.0, 2.0, 3.0];

  list.forEach(print);

  final List<int> doubles = list.map((value) => value * 2).toList();
  print('doubles: $doubles');

  final doublesFor = doubleItems(list);
  print('doublesFor: $doublesFor');

  final triples = transform(list, (item) => item * 3);
  print('triples: $triples');

  final squares = transform(list, (item) => item * item);
  print('squares: $squares');

  final genericSquares = transformG<double>(list2, (item) => item * item);
  print('genericSquares: $genericSquares');

  final moreGenericSquares =
      transformMoreG<double, double>(list2, (item) => item * item);
  print('moreGenericSquares: $moreGenericSquares');
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

// Generic form
List<T> transformG<T>(List<T> items, T Function(T) f) {
  var result = <T>[];
  for (var x in items) {
    result.add(f(x));
  }
  return result;
}

// (even more) Generic form
List<R> transformMoreG<T, R>(List<T> items, R Function(T) f) {
  var result = <R>[];
  for (var x in items) {
    result.add(f(x));
  }
  return result;
}

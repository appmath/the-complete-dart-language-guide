import 'package:dartx/dartx.dart';

extension IterableX on Iterable<int> {
  int sum() => reduce((value, element) => value + element);
}

extension IterableY<T extends num> on Iterable<T> {
  T product() => reduce((value, element) => (value * element) as T);
}

void main() {
  final sum = [1, 2, 3].sum();
  final product = [1.4, 2.4, 3.8].product();

  print('sum: $sum');
  print('product: $product');

  final anotherWord = 'Abcd'.capitalize();
}

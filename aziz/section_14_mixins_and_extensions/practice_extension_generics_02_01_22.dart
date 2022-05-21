extension IterableSum on Iterable<int> {
  int sum() => reduce((value, element) => value + element);
}

extension IterableProduct<T extends num> on Iterable<T> {
  T product() => reduce((value, element) => (value * element) as T);
}

void main() {
  print('sum: ${[1, 2, 3, 4].sum()}');
  print('product: ${[1, 2, 3, 4].product()}');
}

void main() {
  // int? a;
  // print('a: $a');
  // int b = 5;
  // if (a != null) {
  //   int c = a + b;
  //   print('c: $c');
  // } else {
  //   print('null');
  // }

  // Assertion operator
  int x = -1;
  int? maybeValue;
  if (x > 0) {
    maybeValue = x;
  }
  int value = maybeValue ?? 0;
  print('value: $value');

  const cities = <String?>['London', 'Paris', null];

  for (var city in cities) {
    print(city?.toUpperCase());
  }
}

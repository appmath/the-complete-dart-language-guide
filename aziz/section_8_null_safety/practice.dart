import '../deep_dive/dynamic_vs_object.dart';

void main() {
  int? a = 2;
  int b = -1;
  var sum = a + b;

  int? maybeValue;
  if (b > 0) {
    maybeValue = b;
  }
  int value = maybeValue ?? 0;
  print('value: $value');

  const cities = <String?>['london', 'Paris', null];
  for (var city in cities) {
    city = city ?? 'none';
    print('city.toUpperCase(): ${city.toUpperCase()}');
  }
}

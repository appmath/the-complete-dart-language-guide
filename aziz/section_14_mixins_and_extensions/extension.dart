extension on String {
  int? toIntOrNull() => int.tryParse(this);
}

void main() {
  final intOrNull = '123'.toIntOrNull();
  print('intOrNull: $intOrNull');
}
// Description: A Dart package that helps to implement value based equality without needing to explicitly override == and hashCode.
// Note: to be used only with immutable classes (all fields are final)
// URL: https://pub.dev/packages?q=equatable
// Install: flutter pub add equatable
// App: Point class in the the_complete_dart_language_guide  (src/mobile/dart/learning/udemy/the_complete_dart_language_guide/aziz/section_7_data_processing)

// Example:
// @override
//   bool operator ==(covariant Point other) =>
//       identical(this, other) ||
//       runtimeType == other.runtimeType && x == other.x && y == other.y;
//
//   @override
//   String toString() => 'Point($x, $y)';
//
//   Point operator +(covariant Point other) {
//     return Point(x + other.x, y + other.y);
//   }
//
//   Point operator *(covariant int multiplier) {
//     return Point(x * multiplier, y * multiplier);
//   }

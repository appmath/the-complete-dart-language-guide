// Description: simplifies equality comparisons
// URL: https://pub.dev/packages/equatable
// Install: flutter pub add equatable OR dart pub add equatable
// App: Name none
// Full example:
import 'package:equatable/equatable.dart';

class Point extends Equatable {
  const Point(this.x, this.y);

  final int x;
  final int y;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [x, y];
}

// How to use Equitable when a class extends another classs
class SubPoint extends Point implements EquatableMixin {
  const SubPoint(x, y) : super(x, y);

  @override
  List<Object?> get props => [x, y];
}

void main() {
  print(Point(1, 1) == Point(1, 1));
  print(Point(5, 4));

  print(SubPoint(5, 5));
}

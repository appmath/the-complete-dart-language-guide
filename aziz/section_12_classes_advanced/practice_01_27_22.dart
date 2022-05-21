class Animal {
  const Animal({required this.age});

  final int age;

  void sleep() => print('sleep');
}

class Dog extends Animal {
  Dog({required age}) : super(age: age);
}

abstract class Shape {
  double get area;
}

class Square extends Shape {
  Square({required this.side});

  final double side;

  @override
  double get area => side * side;

  @override
  bool operator ==(covariant Square other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && side == other.side;

  @override
  int get hashCode => side.hashCode;
}

class Point {
  Point({required this.x, required this.y});

  final int x;
  final int y;

  Point operator +(Point other) => Point(x: x + other.x, y: y + other.y);

  @override
  bool operator ==(covariant Point other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() {
    return 'Point{x: $x, y: $y}';
  }
}

void main() {
  final square = Square(side: 5);
  print('square.area: ${square.area}');

  final pointSum = Point(x: 5, y: 4) + Point(x: 5, y: 20);
  print('pointSum: ${pointSum}');
}

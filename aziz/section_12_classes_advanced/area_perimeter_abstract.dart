import 'dart:math';

abstract class Shape {
  double get area;
  double get perimeter;
}

class Square extends Shape {
  Square(this.side);

  final double side;

  @override
  double get area => side * side;

  @override
  double get perimeter => 4 * side;
}

class Circle extends Shape {
  Circle(this.radius);

  final double radius;

  @override
  double get area => pi * radius * radius;

  @override
  double get perimeter => 2 * pi * radius;
}

void printValues(Shape shape) {
  print('area: ${shape.area} ,  perimeter: ${shape.perimeter}');
}

void main() {
  final shapes = [Square(5), Circle(10)];
  shapes.forEach((shape) {
    printValues(shape);
  });
}

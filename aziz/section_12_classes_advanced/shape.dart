import 'dart:math';

abstract class Shape {
  double get area;
}

class Square extends Shape {
  Square({required this.side});

  final double side;

  @override
  double get area => side * side;
}

class Circle extends Shape {
  Circle({required this.radius});

  final double radius;

  @override
  double get area => pi * radius * radius;
}

void printArea(Shape shape) {
  print(shape.area);
}

void main() {
  // final shapesJson = [
  //   {
  //     'type': 'square',
  //     'side': 10.0,
  //   },
  //   {
  //     'type': 'circle',
  //     'radius': 5.0,
  //   },
  //   {
  //     'type': 'triangle',
  //   },
  // ];

  final shapes = [Circle(radius: 5), Square(side: 4)];
  shapes.forEach((shape) => printArea(shape));
}

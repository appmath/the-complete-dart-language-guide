import 'dart:ffi';
import 'dart:math';

abstract class Shape {
  double get area;

  const Shape();

  factory Shape.fromJson(Map<String, Object> json) {
    var type = json['type'];
    switch (type) {
      case 'square':
        final side = json['side'];
        if (side is double) {
          return Square(side);
        } else {
          throw UnsupportedError('Invalid or missing side property');
        }
      case 'circle':
        final radius = json['radius'];

        if (radius is double) {
          return Circle(radius);
        } else {
          throw UnsupportedError('Invalid or missing radius property');
        }
      default:
        throw UnsupportedError('shape $type not recognized');
    }
  }
}

class Square extends Shape {
  const Square(this.side);

  final double side;

  @override
  double get area => side * side;

  @override
  String toString() {
    return 'Square{side: $side}';
  }
}

class Circle extends Shape {
  const Circle(this.radius);

  final double radius;

  @override
  double get area => pi * radius * radius;

  @override
  String toString() {
    return 'Circle{radius: $radius}';
  }
}

void printArea(Shape shape) {
  print(shape);
}

void main() {
  final shapesJson = [
    {
      'type': 'square',
      'side': 10.0,
    },
    {
      'type': 'circle',
      'radius': 5.0,
    },
  ];

  var square = Shape.fromJson(shapesJson[0]);
  var circle = Shape.fromJson(shapesJson[1]);
  print('square: $square');
  print('circle: $circle');

  final shapes = shapesJson.map((shapeJson) => Shape.fromJson(shapeJson));
  shapes.forEach(printArea);
}

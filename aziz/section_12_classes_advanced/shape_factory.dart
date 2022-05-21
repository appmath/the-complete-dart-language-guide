import 'dart:math';

abstract class Shape {
  double get area;

  Shape();

  factory Shape.fromJson(Map<String, Object> json) {
    final type = json['type'];
    switch (type) {
      case 'square':
        final side = json['side'];
        if (side is double) {
          return Square(side: side);
        }
        throw UnsupportedError('Side is not a valid value');
      case 'circle':
        final radius = json['radius'];
        if (radius is double) {
          return Circle(radius: radius);
        }
        throw UnsupportedError('Radius is not a valid value');
      default:
        throw UnimplementedError('$type is not a valid value');
    }
  }
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
  final shapesJson = [
    {
      'type': 'square',
      'side': 10.0,
    },
    {
      'type': 'circle',
      'radius': 5.0,
    },
    {
      'type': 'triangle',
    },
  ];

  final shapes = shapesJson.map((shapeJson) => Shape.fromJson(shapeJson));
  try {
    shapes.forEach(printArea);
  } on UnsupportedError catch (u) {
    print('UnsupportedError: $u');
  } catch (u, e) {
    print('Catch-all: $e');
  }
}

class Point {
  Point({required this.x, required this.y});

  final int x;
  final int y;

  @override
  bool operator ==(covariant Point other) {
    if (other is Point) {
      return x == other.x && y == other.y;
    }
    return false;
  }
}

void main() {
  print(Point(x: 0, y: 20) == Point(x: 0, y: 20));
}

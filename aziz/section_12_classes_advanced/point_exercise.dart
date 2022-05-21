class Point {
  const Point(this.x, this.y);

  final int x;
  final int y;

  @override
  bool operator ==(covariant Point other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => 'Point($x, $y)';

  Point operator +(covariant Point other) {
    return Point(x + other.x, y + other.y);
  }

  Point operator *(covariant int multiplier) {
    return Point(x * multiplier, y * multiplier);
  }
}

void main() {
  print(Point(1, 1) == Point(1, 1));
// make this compile by overriding the + operator
  print(Point(1, 1) + Point(2, 0)); // should print: Point(3, 1)
// make this compile by overriding the * operator
  print(Point(2, 1) * 5); // should print: Point(10, 5)
}

class Fraction {
  final int numerator;
  final int denominator;

  Fraction({required this.numerator, required this.denominator}) {
    if (denominator == 0) {
      throw Exception('Cannot divide by zero');
    }
  }

  double get value => numerator / denominator;
}

void main() {
  try {
    final fraction = Fraction(numerator: 5, denominator: 0);
  } on UnsupportedError catch (e) {
    print(e);
  }
}

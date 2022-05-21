class Fraction {
  Fraction({required this.numerator, required this.denominator}) {
    if (denominator == 0) {
      throw IntegerDivisionByZeroException();
    }
  }

  final int numerator;
  final int denominator;

  double get value => numerator / denominator;
}

void testFraction() {
  try {
    final f = Fraction(numerator: 3, denominator: 0);
    print(f.value);
  } on IntegerDivisionByZeroException catch (e) {
    print(e);
  } on Exception catch (e) {
    print(e);
  } finally {
    print('Finally');
  }
}

void main() {
  testFraction();
  print('Done!');
}

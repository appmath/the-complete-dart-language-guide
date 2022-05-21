// Named Constructors
class Complex {
  const Complex({required this.re, required this.im});
  const Complex.zero()
      : re = 0,
        im = 0;
  const Complex.identity()
      : re = 1,
        im = 0;
  const Complex.real()
      : re = 2,
        im = 0;
  const Complex.imaginary()
      : re = 0,
        im = 3;

  final double re;
  final double im;
}

main() {
  // const complex = Complex(re: 1, im: 2);
  // const list = [Complex(re: 1, im: 2), Complex(re: 1, im: 2)];
  final imaginary = Complex.imaginary();
}

class Temperature {
  const Temperature.celsius({required this.celsius})
      : fahrenheit = (celsius * 1.8) + 32;
  const Temperature.fahrenheit({required this.fahrenheit})
      : celsius = (fahrenheit - 32) / 1.8;

  final double celsius;
  final double fahrenheit;
}

void main() {
  const celsiusToF = Temperature.celsius(celsius: 50);
  print('fahrenheit: ${celsiusToF.fahrenheit}');

  const fahrenheitToC = Temperature.fahrenheit(fahrenheit: 74);
  print('celsius: ${fahrenheitToC.celsius}');
}

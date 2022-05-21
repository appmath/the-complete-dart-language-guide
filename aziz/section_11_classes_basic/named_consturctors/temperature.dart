class Temperature {
  Temperature.celsius(this.celsius);
  Temperature.fahrenheit(double fahrenheit) : celsius = (fahrenheit - 32) / 1.8;

  double celsius;
  double get fahrenheit => celsius * 1.8 + 32;
  set fahrenheit(double fahrenheit) => celsius = (fahrenheit - 32) / 1.8;
}

main() {
  final tempF = Temperature.fahrenheit(100);
  print('tempF.celsius: ${tempF.celsius}');
  print('tempF.fahrenheit: ${tempF.fahrenheit}');

  final tempC = Temperature.celsius(30);
  tempC.fahrenheit = 120;
  print('tempC.celsius: ${tempC.celsius}');
  var client = Client();
  print('Client().name: ${client.name}');
}

class Client {
  String _name = "hello";

  set(String name) => _name = name;

  String get name => _name;
}

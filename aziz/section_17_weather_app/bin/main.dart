import 'package:http/http.dart' as http;

import 'weather_api_client.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.length != 1) {
    print('Syntax: dart bin/main.dart <city>');
    return;
  }

  final city = arguments.first;
  print('city: $city');

  final api = WeatherApiClient();
  final locationId = await api.getLocationId(city);
  print('locationId: $locationId');

  final weather = await api.fetchWeather(locationId);
  print('weather: $weather');
}

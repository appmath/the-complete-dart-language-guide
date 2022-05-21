import 'dart:convert';

import 'package:http/http.dart' as http;

import 'weather.dart';

class WeatherApiException implements Exception {
  const WeatherApiException(this.message);
  final String message;
}

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com/api';

  Future<int> getLocationId(String city) async {
    final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');
    final locationResponse = await http.get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw WeatherApiException('Error getting locationId for city: $city');
    }
    print('locationResponse.body: ${locationResponse.body}');

    print('Response: ${jsonDecode(locationResponse.body)}');
    final locationJson = jsonDecode(locationResponse.body) as List;
    if (locationJson.isEmpty) {
      throw WeatherApiException('No location found for: $city');
    }
    return locationJson.first['woeid'] as int;
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl/location/$locationId');
    final weatherResponse = await http.get(weatherUrl);
    // print('weatherResponse: ${json.decode(weatherResponse.body)}');
    final weatherJson = json.decode(weatherResponse.body);
    final consolidatedWeather = weatherJson['consolidated_weather'] as List;
    if (consolidatedWeather.isEmpty) {
      throw WeatherApiException(
          'Error getting weather for location: $locationId');
    }

    return Weather.fromJson(consolidatedWeather[0]);
  }

  Future<Weather> getWeather(String city) async {
    final locationId = await getLocationId(city);
    return fetchWeather(locationId);
  }
}

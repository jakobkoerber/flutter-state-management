import 'dart:convert';
import 'dart:developer';

import 'package:flutter_state_management/weatherComponent/model/current_weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static Future<CurrentWeather> fetchWeather(
    double latitude,
    double longitude,
    bool forceRefresh,
  ) async {
    final client = http.Client();
    final url = Uri.https(
      "api.openweathermap.org",
      "data/2.5/weather",
      {
        "lat": latitude.toString(),
        "lon": longitude.toString(),
        "appid": const String.fromEnvironment("OpenWeatherAPI"),
        "units": "metric",
      },
    );
    final response = await client.get(url);
    log("${response.statusCode} ${url.toString()}");
    final json = jsonDecode(response.body);
    return CurrentWeather.fromJson(json);
  }
}

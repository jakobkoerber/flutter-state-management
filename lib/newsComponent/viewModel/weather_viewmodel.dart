import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/newsComponent/model/current_weather.dart';
import 'package:flutter_state_management/newsComponent/service/weather_service.dart';
import 'package:rxdart/rxdart.dart';

final weatherViewModel = Provider((ref) => WeatherViewModel());

class WeatherViewModel {
  BehaviorSubject<CurrentWeather?> currentWeather =
      BehaviorSubject.seeded(null);

  Future fetchCurrentWeather(
    bool forceRefresh, {
    double lat = 48.264965,
    double long = 11.671448,
  }) {
    return WeatherService.fetchWeather(lat, long, forceRefresh).then(
      (value) => currentWeather.add(value),
      onError: (error) => currentWeather.addError(error),
    );
  }
}

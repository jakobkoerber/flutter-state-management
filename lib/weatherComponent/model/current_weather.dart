import 'package:json_annotation/json_annotation.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather {
  @JsonKey(name: "coord")
  final Coordinates coordinates;
  @JsonKey(name: "weather")
  final List<Weather> weather;
  @JsonKey(name: "base")
  final String base;
  @JsonKey(name: "main")
  final Main main;
  @JsonKey(name: "visibility")
  final int visibility;
  @JsonKey(name: "wind")
  final Wind wind;
  @JsonKey(name: "rain")
  final Rain? rain;
  @JsonKey(name: "clouds")
  final Clouds clouds;
  @JsonKey(name: "dt")
  final int dt;
  @JsonKey(name: "sys")
  final Sys sys;
  @JsonKey(name: "timezone")
  final int timezone;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "cod")
  final int cod;

  CurrentWeather({
    required this.coordinates,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}

@JsonSerializable()
class Clouds {
  @JsonKey(name: "all")
  final int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Coordinates {
  @JsonKey(name: "lon")
  final double lon;
  @JsonKey(name: "lat")
  final double lat;

  Coordinates({
    required this.lon,
    required this.lat,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable()
class Main {
  @JsonKey(name: "temp")
  final double temp;
  @JsonKey(name: "feels_like")
  final double feelsLike;
  @JsonKey(name: "temp_min")
  final double tempMin;
  @JsonKey(name: "temp_max")
  final double tempMax;
  @JsonKey(name: "pressure")
  final int pressure;
  @JsonKey(name: "humidity")
  final int humidity;
  @JsonKey(name: "sea_level")
  final int? seaLevel;
  @JsonKey(name: "grnd_level")
  final int? grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Rain {
  @JsonKey(name: "1h")
  final double the1H;

  Rain({
    required this.the1H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}

@JsonSerializable()
class Sys {
  @JsonKey(name: "type")
  final int type;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "country")
  final String country;
  @JsonKey(name: "sunrise")
  final int sunrise;
  @JsonKey(name: "sunset")
  final int sunset;

  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}

@JsonSerializable()
class Weather {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "main")
  final String main;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "icon")
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Wind {
  @JsonKey(name: "speed")
  final double speed;
  @JsonKey(name: "deg")
  final int deg;
  @JsonKey(name: "gust")
  final double? gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}

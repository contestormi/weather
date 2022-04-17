import 'package:weather/data/models/feels_like_model.dart';
import 'package:weather/data/models/temp_model.dart';
import 'package:weather/data/models/weather_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'daily_model.g.dart';

@JsonSerializable()
class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  @JsonKey(name: 'moon_phase')
  double? moonPhase;
  Temp? temp;
  @JsonKey(name: 'feels_like')
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  @JsonKey(name: 'dew_point')
  double? dewPoint;
  @JsonKey(name: 'wind_speed')
  double? windSpeed;
  @JsonKey(name: 'wind_deg')
  int? windDeg;
  @JsonKey(name: 'wind_gust')
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  double? pop;
  double? uvi;
  double? rain;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
    this.rain,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}

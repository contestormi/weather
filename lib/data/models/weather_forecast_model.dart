import 'package:weather/data/models/current_model.dart';
import 'package:weather/data/models/daily_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather_forecast_model.g.dart';

@JsonSerializable()
class WeatherForecast {
  double? lat;
  double? lon;
  String? timezone;
  @JsonKey(name: 'timezone_offset')
  int? timezoneOffset;
  Current? current;
  List<Daily>? daily;

  WeatherForecast({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.daily,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
}

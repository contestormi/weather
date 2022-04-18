import 'package:weather/data/models/weather_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'current_model.g.dart';

@JsonSerializable()
class Current {
  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  int? pressure;
  int? humidity;
  @JsonKey(name: 'dew_point')
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  @JsonKey(name: 'wind_speed')
  double? windSpeed;
  @JsonKey(name: 'wind_deg')
  int? windDeg;
  @JsonKey(name: 'wind_gust')
  double? windGust;
  List<Weather>? weather;

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

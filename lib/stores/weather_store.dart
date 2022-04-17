import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:weather/data/models/weather_forecast_model.dart';
import 'package:weather/data/open_weather_api.dart';
part 'weather_store.g.dart';

class WeatherStore = _WeatherStoreBase with _$WeatherStore;

abstract class _WeatherStoreBase with Store {
  final OpenWeatherAPI _openWeatherAPI = OpenWeatherAPI();

  @observable
  double lat = 55.7522;
  @observable
  double lon = 37.6156;

  @action
  Future<WeatherForecast> getWeatherData() async {
    final _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = _position.latitude;
    lon = _position.longitude;
    final weatherForecastData =
        await _openWeatherAPI.getWeatherData(lat: lat, lon: lon);
    return weatherForecastData;
  }
}

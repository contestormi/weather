import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:weather/data/models/weather_forecast_model.dart';
import 'package:weather/data/open_weather_api.dart';
part 'weather_store.g.dart';

class WeatherStore = _WeatherStoreBase with _$WeatherStore;

abstract class _WeatherStoreBase with Store {
  final _openWeatherAPI = OpenWeatherAPI();

  @observable
  WeatherForecast weatherForecast = WeatherForecast();
  @observable
  double lat = 0;
  @observable
  double lon = 0;

  @action
  Future<void> getWeatherData() async {
    final _position = await Geolocator.getCurrentPosition();
    lat = _position.latitude;
    lon = _position.longitude;
    weatherForecast = await _openWeatherAPI.getWeatherData(lat: lat, lon: lon);
  }
}

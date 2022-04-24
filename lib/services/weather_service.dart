import 'package:weather/data/open_weather_api.dart';
import 'package:weather/stores/weather_store.dart';

class WeatherService {
  final OpenWeatherAPI openWeatherAPI;
  final WeatherStore weatherStore;

  WeatherService({
    required this.openWeatherAPI,
    required this.weatherStore,
  });

  Future<void> getWeatherData(
      {required double lat, required double lon}) async {
    final weatherForecast =
        await openWeatherAPI.getWeatherData(lat: lat, lon: lon);
    weatherStore.setUpWeatherFields(weatherForecast);
  }

  Future<void> getCityWeatherData(String cityName) async {
    final city = (await openWeatherAPI.getCityCords(cityName))[0];
    final weatherForecast =
        await openWeatherAPI.getWeatherData(lat: city.lat!, lon: city.lon!);
    weatherStore.setUpWeatherFields(weatherForecast);
  }
}

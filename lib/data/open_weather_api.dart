import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/data/models/geocoding_model.dart';
import 'package:weather/data/models/weather_forecast_model.dart';

/// Класс в котором собраны все запросы к OpenWeatherAPI, которые 
/// используются в приложении.
class OpenWeatherAPI {
  static const String _openWeatherAPIKey = "97535c66f6735430593f9d1c46751055";
  static const String _baseUrl = "https://api.openweathermap.org";

  /// Запрос для получения погоды в городе по координатам.
  Future<WeatherForecast> getWeatherData({
    required double lat,
    required double lon,
    String excludePart = "minutely,hourly",
    String units = "metric",
    String lang = "en",
  }) async {
    String url =
        "$_baseUrl/data/2.5/onecall?lat=$lat&lon=$lon&lang=$lang&exclude=$excludePart&units=$units&appid=$_openWeatherAPIKey";
    final http.Response response;

    try {
      response = await http.get(Uri.parse(url));
    } catch (e) {
      rethrow;
    }

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  /// Запрос для получения погоды в городе по названию города.
  Future<List<GeocodingModel>> getCityCords(String cityName) async {
    String url =
        "$_baseUrl/geo/1.0/direct?q=$cityName&limit=1&appid=$_openWeatherAPIKey";
    final http.Response response;

    try {
      response = await http.get(Uri.parse(url));
    } catch (e) {
      rethrow;
    }

    if (response.statusCode == 200) {
      final List? jsonResponse = jsonDecode(response.body) as List<dynamic>?;

      return jsonResponse!
          .map(
              (model) => GeocodingModel.fromJson(model as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed');
    }
  }
}

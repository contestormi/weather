import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/data/models/weather_forecast_model.dart';

class OpenWeatherAPI {
  static const String _openWeatherAPIKey = "f45de4975f3df6c72d3bbe3140f6fb5d";
  static const String _baseUrl =
      "https://api.openweathermap.org/data/2.5/onecall";

  Future<WeatherForecast> getWeatherData(
      {required double lat,
      required double lon,
      String excludePart = "minutely"}) async {
    String url =
        "$_baseUrl?lat=$lat&lon=$lon&exclude=$excludePart&appid=$_openWeatherAPIKey";
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
}

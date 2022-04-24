import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/data/open_weather_api.dart';
import 'package:weather/services/geolocator_service.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/stores/weather_store.dart';
import 'package:weather/ui/main_screen.dart';

void main() async {
  WeatherStore _weatherStore = WeatherStore();
  OpenWeatherAPI _openWeatherAPI = OpenWeatherAPI();
  WeatherService _weatherService = WeatherService(
      openWeatherAPI: _openWeatherAPI, weatherStore: _weatherStore);

  await GeolocatorService().checkPermissionAndGetGeoLocation();
  final _position = await Geolocator.getCurrentPosition();

  await _weatherService.getWeatherData(
      lon: _position.longitude, lat: _position.longitude);

  runApp(MyApp(
    weatherStore: _weatherStore,
    weatherService: _weatherService,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.weatherStore,
    required this.weatherService,
  }) : super(key: key);

  final WeatherStore weatherStore;
  final WeatherService weatherService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        initialData: ConnectivityResult.mobile,
        stream: Connectivity().onConnectivityChanged,
        builder: (_, connection) {
          if (connection.data == ConnectivityResult.wifi ||
              connection.data == ConnectivityResult.mobile) {
            return MainScreen(
              weatherStore: weatherStore,
              weatherService: weatherService,
            );
          } else {
            return const Center(
              child: Text('Заглушка'),
            );
          }
        },
      ),
    );
  }
}

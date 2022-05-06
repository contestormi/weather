import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/data/open_weather_api.dart';
import 'package:weather/services/geolocator_service.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/stores/weather_store.dart';
import 'package:weather/ui/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WeatherStore _weatherStore = WeatherStore();
  OpenWeatherAPI _openWeatherAPI = OpenWeatherAPI();
  WeatherService _weatherService = WeatherService(
      openWeatherAPI: _openWeatherAPI, weatherStore: _weatherStore);

  await GeolocatorService().checkPermissionAndGetGeoLocation();
  final _position = await Geolocator.getCurrentPosition();

  final _connectivityResult = Connectivity().onConnectivityChanged;

  _connectivityResult.listen((event) async {
    if (event == ConnectivityResult.mobile ||
        event == ConnectivityResult.wifi) {
      await _weatherService.getWeatherData(
          lat: _position.latitude, lon: _position.longitude);
    }
  });

  runApp(MyApp(
    weatherStore: _weatherStore,
    weatherService: _weatherService,
    connectivityResult: _connectivityResult,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.weatherStore,
    required this.weatherService,
    required this.connectivityResult,
  }) : super(key: key);

  final WeatherStore weatherStore;
  final WeatherService weatherService;
  final Stream<ConnectivityResult> connectivityResult;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
          initialData: ConnectivityResult.none,
          stream: connectivityResult,
          builder: (_, connection) {
            return MainScreen(
              weatherStore: weatherStore,
              weatherService: weatherService,
              connectionData: connection.data,
            );
          }),
    );
  }
}

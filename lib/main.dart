import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:weather/data/models/weather_forecast_model.dart';
import 'package:weather/services/geolocator_service.dart';
import 'package:weather/stores/weather_store.dart';
import 'package:weather/ui/main_screen.dart';

void main() async {
  WeatherStore weatherStore = WeatherStore();
  WidgetsFlutterBinding.ensureInitialized();
  await GeolocatorService().checkPermissionAndGetGeoLocation();
  await weatherStore.getWeatherData();
  runApp(MyApp(
    weatherForecast: weatherStore.weatherForecast,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.weatherForecast}) : super(key: key);
  final WeatherForecast weatherForecast;
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
              weatherForecast: weatherForecast,
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

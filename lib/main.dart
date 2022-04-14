import 'package:flutter/material.dart';
import 'package:weather/services/geolocator_service.dart';
import 'package:weather/ui/main_screen.dart';

void main() {
  runApp(const MyApp());
  GeolocatorService().determinePosition();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

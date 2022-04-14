import 'package:connectivity_plus/connectivity_plus.dart';
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
            return const MainScreen();
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

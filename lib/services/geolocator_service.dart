import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Future<void> _checkPermissionStatus() async {
    LocationPermission _permission;

    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.checkPermission();
      if (_permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (_permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  Future<Position> determinePosition() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      return Future.error('Location services are disabled.');
    }

    _checkPermissionStatus();

    return await Geolocator.getCurrentPosition();
  }
}

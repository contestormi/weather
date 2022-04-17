// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherStoreBase, Store {
  final _$weatherForecastAtom = Atom(name: '_WeatherStoreBase.weatherForecast');

  @override
  WeatherForecast get weatherForecast {
    _$weatherForecastAtom.reportRead();
    return super.weatherForecast;
  }

  @override
  set weatherForecast(WeatherForecast value) {
    _$weatherForecastAtom.reportWrite(value, super.weatherForecast, () {
      super.weatherForecast = value;
    });
  }

  final _$latAtom = Atom(name: '_WeatherStoreBase.lat');

  @override
  double get lat {
    _$latAtom.reportRead();
    return super.lat;
  }

  @override
  set lat(double value) {
    _$latAtom.reportWrite(value, super.lat, () {
      super.lat = value;
    });
  }

  final _$lonAtom = Atom(name: '_WeatherStoreBase.lon');

  @override
  double get lon {
    _$lonAtom.reportRead();
    return super.lon;
  }

  @override
  set lon(double value) {
    _$lonAtom.reportWrite(value, super.lon, () {
      super.lon = value;
    });
  }

  final _$getWeatherDataAsyncAction =
      AsyncAction('_WeatherStoreBase.getWeatherData');

  @override
  Future<void> getWeatherData() {
    return _$getWeatherDataAsyncAction.run(() => super.getWeatherData());
  }

  @override
  String toString() {
    return '''
weatherForecast: ${weatherForecast},
lat: ${lat},
lon: ${lon}
    ''';
  }
}

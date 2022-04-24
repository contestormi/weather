import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/data/models/current_model.dart';
import 'package:weather/data/models/daily_model.dart';
import 'package:weather/data/models/feels_like_model.dart';
import 'package:weather/data/models/temp_model.dart';
import 'package:weather/data/models/weather_forecast_model.dart';
import 'package:weather/data/models/weather_model.dart';
import 'package:weather/data/open_weather_api.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/stores/weather_store.dart';

class MockOpenWeatherAPI extends Mock implements OpenWeatherAPI {}

void main() {
  late WeatherStore store;
  late MockOpenWeatherAPI mockOpenWeatherAPI;
  late WeatherService sut;

  setUp(() async {
    store = WeatherStore();
    mockOpenWeatherAPI = MockOpenWeatherAPI();
    sut =
        WeatherService(openWeatherAPI: mockOpenWeatherAPI, weatherStore: store);
  });

  test('initial values are correct', () {
    expect(store.date, 0);
    expect(store.timezone, '');
    expect(store.icon, '');
    expect(store.temp, 0);
    expect(store.windSpeed, 0);
    expect(store.visibility, 0);
    expect(store.humidity, 0);
    expect(store.pressure, 0);
    expect(store.firstDayDate, 0);
    expect(store.firstDayIcon, '');
    expect(store.firstDayTemp, 0);
    expect(store.secondDayDate, 0);
    expect(store.secondDayIcon, '');
    expect(store.secondDayTemp, 0);
    expect(store.thirdDayDate, 0);
    expect(store.thirdDayIcon, '');
    expect(store.thirdDayTemp, 0);
    expect(store.fourthDayDate, 0);
    expect(store.fourthDayIcon, '');
    expect(store.fourthDayTemp, 0);
    expect(store.fifthDayDate, 0);
    expect(store.fifthDayIcon, '');
    expect(store.fifthDayTemp, 0);
  });

  group('getWeatherData', () {
    var weatherForecastMockData = WeatherForecast(
      current: Current(
        dewPoint: 0,
        clouds: 0,
        dt: 0,
        feelsLike: 0,
        humidity: 0,
        pressure: 0,
        sunrise: 0,
        sunset: 0,
        temp: 0,
        uvi: 0,
        visibility: 0,
        weather: <Weather>[
          Weather(
            description: 'Some string',
            icon: 'Some icon',
            id: 0,
            main: 'main',
          ),
        ],
        windDeg: 0,
        windGust: 0,
        windSpeed: 0,
      ),
      lat: 0,
      lon: 0,
      timezone: 'Moscow',
      timezoneOffset: 0,
      daily: <Daily>[
        Daily(
          clouds: 0,
          dewPoint: 0,
          dt: 0,
          feelsLike: FeelsLike(
            day: 0,
            eve: 0,
            morn: 0,
            night: 0,
          ),
          humidity: 0,
          moonPhase: 0,
          moonrise: 0,
          moonset: 0,
          pop: 0,
          pressure: 0,
          rain: 0,
          sunrise: 0,
          sunset: 0,
          temp: Temp(
            day: 0,
            eve: 0,
            max: 0,
            min: 0,
            morn: 0,
            night: 0,
          ),
          uvi: 0,
          weather: <Weather>[
            Weather(
              description: 'Some string',
              icon: 'Some icon',
              id: 0,
              main: 'main',
            ),
          ],
          windDeg: 0,
          windGust: 0,
          windSpeed: 0,
        ),
        Daily(
          clouds: 0,
          dewPoint: 0,
          dt: 0,
          feelsLike: FeelsLike(
            day: 0,
            eve: 0,
            morn: 0,
            night: 0,
          ),
          humidity: 0,
          moonPhase: 0,
          moonrise: 0,
          moonset: 0,
          pop: 0,
          pressure: 0,
          rain: 0,
          sunrise: 0,
          sunset: 0,
          temp: Temp(
            day: 0,
            eve: 0,
            max: 0,
            min: 0,
            morn: 0,
            night: 0,
          ),
          uvi: 0,
          weather: <Weather>[
            Weather(
              description: 'Some string',
              icon: 'Some icon',
              id: 0,
              main: 'main',
            ),
          ],
          windDeg: 0,
          windGust: 0,
          windSpeed: 0,
        ),
        Daily(
          clouds: 0,
          dewPoint: 0,
          dt: 0,
          feelsLike: FeelsLike(
            day: 0,
            eve: 0,
            morn: 0,
            night: 0,
          ),
          humidity: 0,
          moonPhase: 0,
          moonrise: 0,
          moonset: 0,
          pop: 0,
          pressure: 0,
          rain: 0,
          sunrise: 0,
          sunset: 0,
          temp: Temp(
            day: 0,
            eve: 0,
            max: 0,
            min: 0,
            morn: 0,
            night: 0,
          ),
          uvi: 0,
          weather: <Weather>[
            Weather(
              description: 'Some string',
              icon: 'Some icon',
              id: 0,
              main: 'main',
            ),
          ],
          windDeg: 0,
          windGust: 0,
          windSpeed: 0,
        ),
        Daily(
          clouds: 0,
          dewPoint: 0,
          dt: 0,
          feelsLike: FeelsLike(
            day: 0,
            eve: 0,
            morn: 0,
            night: 0,
          ),
          humidity: 0,
          moonPhase: 0,
          moonrise: 0,
          moonset: 0,
          pop: 0,
          pressure: 0,
          rain: 0,
          sunrise: 0,
          sunset: 0,
          temp: Temp(
            day: 0,
            eve: 0,
            max: 0,
            min: 0,
            morn: 0,
            night: 0,
          ),
          uvi: 0,
          weather: <Weather>[
            Weather(
              description: 'Some string',
              icon: 'Some icon',
              id: 0,
              main: 'main',
            ),
          ],
          windDeg: 0,
          windGust: 0,
          windSpeed: 0,
        ),
        Daily(
          clouds: 0,
          dewPoint: 0,
          dt: 0,
          feelsLike: FeelsLike(
            day: 0,
            eve: 0,
            morn: 0,
            night: 0,
          ),
          humidity: 0,
          moonPhase: 0,
          moonrise: 0,
          moonset: 0,
          pop: 0,
          pressure: 0,
          rain: 0,
          sunrise: 0,
          sunset: 0,
          temp: Temp(
            day: 0,
            eve: 0,
            max: 0,
            min: 0,
            morn: 0,
            night: 0,
          ),
          uvi: 0,
          weather: <Weather>[
            Weather(
              description: 'Some string',
              icon: 'Some icon',
              id: 0,
              main: 'main',
            ),
          ],
          windDeg: 0,
          windGust: 0,
          windSpeed: 0,
        ),
        Daily(
          clouds: 0,
          dewPoint: 0,
          dt: 0,
          feelsLike: FeelsLike(
            day: 0,
            eve: 0,
            morn: 0,
            night: 0,
          ),
          humidity: 0,
          moonPhase: 0,
          moonrise: 0,
          moonset: 0,
          pop: 0,
          pressure: 0,
          rain: 0,
          sunrise: 0,
          sunset: 0,
          temp: Temp(
            day: 0,
            eve: 0,
            max: 0,
            min: 0,
            morn: 0,
            night: 0,
          ),
          uvi: 0,
          weather: <Weather>[
            Weather(
              description: 'Some string',
              icon: 'Some icon',
              id: 0,
              main: 'main',
            ),
          ],
          windDeg: 0,
          windGust: 0,
          windSpeed: 0,
        ),
      ],
    );

    test('gets weather using api only once', () async {
      when(() => mockOpenWeatherAPI.getWeatherData(lat: 0, lon: 0))
          .thenAnswer((_) async => weatherForecastMockData);

      await sut.getWeatherData(lon: 0, lat: 0);
      verify(() => mockOpenWeatherAPI.getWeatherData(lat: 0, lon: 0)).called(1);
    });
  });
}

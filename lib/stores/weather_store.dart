import 'package:mobx/mobx.dart';
import 'package:weather/data/models/weather_forecast_model.dart';
part 'weather_store.g.dart';

/// Стор, который отвечает за контроль состояния в приложении.
class WeatherStore = _WeatherStoreBase with _$WeatherStore;

abstract class _WeatherStoreBase with Store {
  @observable
  bool isLoading = true;

  @observable
  int date = 0;

  @observable
  String timezone = '';

  @observable
  String icon = '';

  @observable
  int temp = 0;

  @observable
  double windSpeed = 0;

  @observable
  int visibility = 0;

  @observable
  int humidity = 0;

  @observable
  int pressure = 0;

  @observable
  int firstDayDate = 0;

  @observable
  String firstDayIcon = '';

  @observable
  int firstDayTemp = 0;

  @observable
  int secondDayDate = 0;

  @observable
  String secondDayIcon = '';

  @observable
  int secondDayTemp = 0;

  @observable
  int thirdDayDate = 0;

  @observable
  String thirdDayIcon = '';

  @observable
  int thirdDayTemp = 0;

  @observable
  int fourthDayDate = 0;

  @observable
  String fourthDayIcon = '';

  @observable
  int fourthDayTemp = 0;

  @observable
  int fifthDayDate = 0;

  @observable
  String fifthDayIcon = '';

  @observable
  int fifthDayTemp = 0;

  @action
  void setUpWeatherFields(WeatherForecast weatherForecast) {
    date = weatherForecast.current!.dt!;
    timezone = weatherForecast.timezone!;
    icon = weatherForecast.current!.weather![0].icon.toString();
    temp = weatherForecast.current!.temp!.round();
    windSpeed = weatherForecast.current!.windSpeed!;
    visibility = weatherForecast.current!.visibility!;
    humidity = weatherForecast.current!.humidity!;
    pressure = weatherForecast.current!.pressure!;

    firstDayDate = weatherForecast.daily![1].dt!;
    firstDayIcon = weatherForecast.daily![1].weather![0].icon.toString();
    firstDayTemp = weatherForecast.daily![1].temp!.day!.round();

    secondDayDate = weatherForecast.daily![2].dt!;
    secondDayIcon = weatherForecast.daily![2].weather![0].icon.toString();
    secondDayTemp = weatherForecast.daily![2].temp!.day!.round();

    thirdDayDate = weatherForecast.daily![3].dt!;
    thirdDayIcon = weatherForecast.daily![3].weather![0].icon.toString();
    thirdDayTemp = weatherForecast.daily![3].temp!.day!.round();

    fourthDayDate = weatherForecast.daily![4].dt!;
    fourthDayIcon = weatherForecast.daily![4].weather![0].icon.toString();
    fourthDayTemp = weatherForecast.daily![4].temp!.day!.round();

    fifthDayDate = weatherForecast.daily![5].dt!;
    fifthDayIcon = weatherForecast.daily![5].weather![0].icon.toString();
    fifthDayTemp = weatherForecast.daily![5].temp!.day!.round();
  }
}

import 'package:flutter/material.dart';
import 'package:weather/data/models/weather_forecast_model.dart';
import 'package:weather/utils/date_parse.dart';
import 'package:weather/utils/network_Icon_String_Builder.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget({
    Key? key,
    required this.weatherForecast,
  }) : super(key: key);

  final WeatherForecast weatherForecast;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Следующие 5 дней',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ForecastOnTheNextDay(
                  day: DateParseUtil.convertUnixTimeToDayOfTheWeek(
                      weatherForecast.daily?[1].dt ?? 0),
                  icon: NetworkIconStringBuilderUtil.networkIconStringBuilder(
                      weatherForecast.daily![1].weather![0].icon.toString()),
                  temperature:
                      "${weatherForecast.daily?[1].temp?.day?.round()}°C",
                ),
                _ForecastOnTheNextDay(
                  day: DateParseUtil.convertUnixTimeToDayOfTheWeek(
                      weatherForecast.daily?[2].dt ?? 0),
                  icon: NetworkIconStringBuilderUtil.networkIconStringBuilder(
                      weatherForecast.daily![2].weather![0].icon.toString()),
                  temperature:
                      "${weatherForecast.daily?[2].temp?.day?.round()}°C",
                ),
                _ForecastOnTheNextDay(
                  day: DateParseUtil.convertUnixTimeToDayOfTheWeek(
                      weatherForecast.daily?[3].dt ?? 0),
                  icon: NetworkIconStringBuilderUtil.networkIconStringBuilder(
                      weatherForecast.daily![3].weather![0].icon.toString()),
                  temperature:
                      "${weatherForecast.daily?[3].temp?.day?.round()}°C",
                ),
                _ForecastOnTheNextDay(
                  day: DateParseUtil.convertUnixTimeToDayOfTheWeek(
                      weatherForecast.daily?[4].dt ?? 0),
                  icon: NetworkIconStringBuilderUtil.networkIconStringBuilder(
                      weatherForecast.daily![4].weather![0].icon.toString()),
                  temperature:
                      "${weatherForecast.daily?[4].temp?.day?.round()}°C",
                ),
                _ForecastOnTheNextDay(
                  day: DateParseUtil.convertUnixTimeToDayOfTheWeek(
                      weatherForecast.daily?[5].dt ?? 0),
                  icon: NetworkIconStringBuilderUtil.networkIconStringBuilder(
                      weatherForecast.daily![5].weather![0].icon.toString()),
                  temperature:
                      "${weatherForecast.daily?[5].temp?.day?.round()}°C",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ForecastOnTheNextDay extends StatelessWidget {
  const _ForecastOnTheNextDay({
    Key? key,
    required this.day,
    required this.icon,
    required this.temperature,
  }) : super(key: key);

  final String day;
  final String icon;
  final String temperature;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(day),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: 70,
          height: 75,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(212, 212, 212, 1),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: Image.network(icon),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                temperature,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

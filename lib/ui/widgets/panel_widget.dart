import 'package:flutter/material.dart';
import 'package:weather/data/models/weather_forecast_model.dart';

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
                  day: "ВС",
                  icon: "assets/icons/snow.png",
                  temperature: "${weatherForecast.current?.temp?.round()}°C",
                ),
                _ForecastOnTheNextDay(
                  day: "ПН",
                  icon: "assets/icons/small_snow.png",
                  temperature: "${weatherForecast.current?.temp?.round()}°C",
                ),
                _ForecastOnTheNextDay(
                  day: "ВТ",
                  icon: "assets/icons/hail.png",
                  temperature: "${weatherForecast.current?.temp?.round()}°C",
                ),
                _ForecastOnTheNextDay(
                  day: "СР",
                  icon: "assets/icons/lightning.png",
                  temperature: "${weatherForecast.current?.temp?.round()}°C",
                ),
                _ForecastOnTheNextDay(
                  day: "ЧТ",
                  icon: "assets/icons/cloudy.png",
                  temperature: "${weatherForecast.current?.temp?.round()}°C",
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
                child: Image.asset(icon),
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

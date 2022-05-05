import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather/app_theme/app_theme.dart';
import 'package:weather/stores/weather_store.dart';
import 'package:weather/utils/date_parse.dart';
import 'package:weather/utils/icon_string_builder.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget({
    Key? key,
    required this.weatherStore,
  }) : super(key: key);

  final WeatherStore weatherStore;
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
              'The next 5 days',
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
                      weatherStore.firstDayDate),
                  icon: IconStringBuilder.network(weatherStore.firstDayIcon),
                  temperature: "${weatherStore.firstDayTemp}°C",
                  isLoading: weatherStore.isLoading,
                ),
                _ForecastOnTheNextDay(
                  day: DateParseUtil.convertUnixTimeToDayOfTheWeek(
                      weatherStore.secondDayDate),
                  icon: IconStringBuilder.network(weatherStore.secondDayIcon),
                  temperature: "${weatherStore.secondDayTemp}°C",
                  isLoading: weatherStore.isLoading,
                ),
                _ForecastOnTheNextDay(
                  day: DateParseUtil.convertUnixTimeToDayOfTheWeek(
                      weatherStore.thirdDayDate),
                  icon: IconStringBuilder.network(weatherStore.thirdDayIcon),
                  temperature: "${weatherStore.thirdDayTemp}°C",
                  isLoading: weatherStore.isLoading,
                ),
                _ForecastOnTheNextDay(
                  day: DateParseUtil.convertUnixTimeToDayOfTheWeek(
                      weatherStore.fourthDayDate),
                  icon: IconStringBuilder.network(weatherStore.fourthDayIcon),
                  temperature: "${weatherStore.fourthDayTemp}°C",
                  isLoading: weatherStore.isLoading,
                ),
                _ForecastOnTheNextDay(
                  day: DateParseUtil.convertUnixTimeToDayOfTheWeek(
                      weatherStore.fifthDayDate),
                  icon: IconStringBuilder.network(weatherStore.fifthDayIcon),
                  temperature: "${weatherStore.fifthDayTemp}°C",
                  isLoading: weatherStore.isLoading,
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
    required this.isLoading,
  }) : super(key: key);

  final String day;
  final String icon;
  final String temperature;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer(
            gradient: AppColors.shimmerGradient,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 12,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  width: 60,
                  height: 75,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(day),
              const SizedBox(
                height: 6,
              ),
              Container(
                width: 60,
                height: 65,
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
                      child: Image.network(
                        icon,
                        errorBuilder: (_, __, ___) {
                          return Container(
                            color: Colors.white,
                          );
                        },
                      ),
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

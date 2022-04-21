import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather/app_theme/app_theme.dart';
import 'package:weather/data/models/weather_forecast_model.dart';
import 'package:weather/ui/widgets/custom_text_form_field_widget.dart';
import 'package:weather/ui/widgets/forecast_indicator_widget.dart';
import 'package:weather/ui/widgets/panel_widget.dart';
import 'package:weather/utils/date_parse.dart';
import 'package:weather/utils/network_Icon_String_Builder.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.weatherForecast}) : super(key: key);
  final WeatherForecast weatherForecast;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40),
        ),
        maxHeight: 200,
        minHeight: 60,
        backdropEnabled: true,
        panel: PanelWidget(
          weatherForecast: weatherForecast,
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.blue,
                AppColors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 25),
                child: Stack(
                  children: const [
                    CustomTextFormFieldWidget(),
                    Positioned(
                      right: 27,
                      top: 10,
                      bottom: 10,
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Column(
                children: [
                  Text(
                    DateParseUtil.convertUnixTimeToDateTime(
                        weatherForecast.current?.dt ?? 0),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    weatherForecast.timezone
                        .toString()
                        .split('/')
                        .last
                        .replaceAll(RegExp("[_\$]"), ' '),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              Container(
                width: 240,
                height: 240,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: Image.network(
                        NetworkIconStringBuilderUtil.networkIconStringBuilder(
                            weatherForecast.current!.weather![0].icon
                                .toString()),
                      ),
                    ),
                    Text(
                      "${weatherForecast.current?.temp?.round()}°C",
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 100,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              _ForeCastIndicators(
                weatherForecast: weatherForecast,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForeCastIndicators extends StatelessWidget {
  const _ForeCastIndicators({Key? key, required this.weatherForecast})
      : super(key: key);
  final WeatherForecast weatherForecast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForecastIndicatorWidget(
              forecastIndicatorName: "Скорость ветра",
              forecastIndicatorValue:
                  "${weatherForecast.current?.windSpeed} м/c",
            ),
            ForecastIndicatorWidget(
              forecastIndicatorName: "Видимость",
              forecastIndicatorValue:
                  "${weatherForecast.current?.visibility} метра",
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForecastIndicatorWidget(
              forecastIndicatorName: "Влажность",
              forecastIndicatorValue: "${weatherForecast.current?.humidity} %",
            ),
            ForecastIndicatorWidget(
              forecastIndicatorName: "Давление",
              forecastIndicatorValue:
                  "${weatherForecast.current?.pressure} мбар",
            ),
          ],
        ),
      ],
    );
  }
}

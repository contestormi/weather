import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather/app_theme/app_theme.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/stores/weather_store.dart';
import 'package:weather/ui/widgets/custom_text_form_field_widget.dart';
import 'package:weather/ui/widgets/forecast_indicator_widget.dart';
import 'package:weather/ui/widgets/panel_widget.dart';
import 'package:weather/utils/date_parse.dart';
import 'package:weather/utils/icon_string_builder.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    Key? key,
    required this.weatherStore,
    required this.weatherService,
  }) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();
  final WeatherStore weatherStore;
  final WeatherService weatherService;

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Material(
              child: SlidingUpPanel(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
                maxHeight: 200,
                minHeight: 60,
                backdropEnabled: true,
                panel: PanelWidget(
                  weatherStore: weatherStore,
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
                        padding:
                            const EdgeInsets.only(right: 15, left: 15, top: 25),
                        child: Stack(
                          children: [
                            CustomTextFormFieldWidget(
                              controller: textEditingController,
                            ),
                            Positioned(
                              right: 27,
                              top: 10,
                              bottom: 10,
                              child: IconButton(
                                  onPressed: () =>
                                      weatherService.getCityWeatherData(
                                          textEditingController.text.trim()),
                                  icon: const Icon(Icons.search)),
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
                                weatherStore.date),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            weatherStore.timezone
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
                                IconStringBuilder.network(weatherStore.icon),
                              ),
                            ),
                            Text(
                              "${weatherStore.temp}°C",
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
                        weatherStore: weatherStore,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class _ForeCastIndicators extends StatelessWidget {
  const _ForeCastIndicators({Key? key, required this.weatherStore})
      : super(key: key);
  final WeatherStore weatherStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForecastIndicatorWidget(
              forecastIndicatorName: "Скорость ветра",
              forecastIndicatorValue: "${weatherStore.windSpeed} м/c",
            ),
            ForecastIndicatorWidget(
              forecastIndicatorName: "Видимость",
              forecastIndicatorValue: "${weatherStore.visibility} метра",
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
              forecastIndicatorValue: "${weatherStore.humidity} %",
            ),
            ForecastIndicatorWidget(
              forecastIndicatorName: "Давление",
              forecastIndicatorValue: "${weatherStore.pressure} мбар",
            ),
          ],
        ),
      ],
    );
  }
}

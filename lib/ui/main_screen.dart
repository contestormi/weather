import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather/app_theme/app_theme.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/stores/weather_store.dart';
import 'package:weather/ui/widgets/custom_text_form_field_widget.dart';
import 'package:weather/ui/widgets/forecast_indicator_widget.dart';
import 'package:weather/ui/widgets/panel_widget.dart';
import 'package:weather/utils/date_parse.dart';
import 'package:weather/utils/icon_string_builder.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
    required this.weatherStore,
    required this.weatherService,
    required this.connectionData,
  }) : super(key: key);

  final WeatherStore weatherStore;
  final WeatherService weatherService;
  final Object? connectionData;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

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
                  weatherStore: widget.weatherStore,
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
                        child: CustomTextFormFieldWidget(
                          textEditingController: _textEditingController,
                          valueListenable: _textEditingController,
                          weatherStore: widget.weatherStore,
                          focusNode: _focusNode,
                          suffixIcon: IconButton(
                            onPressed: () {
                              widget.weatherService.getCityWeatherData(
                                  _textEditingController.text.trim());
                              _textEditingController.clear();
                              FocusScope.of(context).unfocus();
                            },
                            icon: const Icon(Icons.search),
                          ),
                          connectionData: widget.connectionData,
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      widget.weatherStore.isLoading
                          ? Shimmer(
                              gradient: AppColors.shimmerGradient,
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 14,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(6),
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                Text(
                                  DateParseUtil.convertUnixTimeToDateTime(
                                          widget.weatherStore.date)
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  widget.weatherStore.timezone
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
                      widget.weatherStore.isLoading
                          ? Shimmer(
                              gradient: AppColors.shimmerGradient,
                              child: Container(
                                width: 240,
                                height: 240,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(
                              width: 240,
                              height: 240,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 75,
                                      height: 75,
                                      child: Image.network(
                                        IconStringBuilder.network(
                                            widget.weatherStore.icon),
                                      ),
                                    ),
                                    Text(
                                      "${widget.weatherStore.temp}°C",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 31,
                      ),
                      _ForeCastIndicators(
                        weatherStore: widget.weatherStore,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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
              forecastIndicatorName: "Wind speed",
              forecastIndicatorValue: "${weatherStore.windSpeed} m/s",
              isLoading: weatherStore.isLoading,
            ),
            ForecastIndicatorWidget(
              forecastIndicatorName: "Visibility",
              forecastIndicatorValue: "${weatherStore.visibility} meters",
              isLoading: weatherStore.isLoading,
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
              forecastIndicatorName: "Humidity",
              forecastIndicatorValue: "${weatherStore.humidity} %",
              isLoading: weatherStore.isLoading,
            ),
            ForecastIndicatorWidget(
              forecastIndicatorName: "Pressure",
              forecastIndicatorValue: "${weatherStore.pressure} mbar",
              isLoading: weatherStore.isLoading,
            ),
          ],
        ),
      ],
    );
  }
}

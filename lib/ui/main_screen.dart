import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather/app_theme/app_theme.dart';
import 'package:weather/ui/widgets/custom_text_form_field_widget.dart';
import 'package:weather/ui/widgets/forecast_indicator_widget.dart';
import 'package:weather/ui/widgets/panel_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
        panel: const PanelWidget(),
        body: Container(
          padding: const EdgeInsets.only(top: 25),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: AppTheme.linearGradientColors,
                begin: Alignment.topCenter,
                end: Alignment.topCenter,
                stops: [0.5, 0.1, 0.4]),
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
                children: const [
                  Text(
                    "Сегодня, 7 Мая, 2022",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Барселона",
                    style: TextStyle(
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
                      child: Image.asset("assets/icons/small_snow.png"),
                    ),
                    const Text(
                      "10°C",
                      style: TextStyle(
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
              const _ForeCastIndiactors(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForeCastIndiactors extends StatelessWidget {
  const _ForeCastIndiactors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ForecastIndiactorWidget(
              forecastIndicatorName: "Скорость ветра",
              forecastIndicatorValue: "7 м/c",
            ),
            ForecastIndiactorWidget(
              forecastIndicatorName: "Видимость",
              forecastIndicatorValue: "6.4 метра",
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ForecastIndiactorWidget(
              forecastIndicatorName: "Влажность",
              forecastIndicatorValue: "85%",
            ),
            ForecastIndiactorWidget(
              forecastIndicatorName: "Давление",
              forecastIndicatorValue: "998 мбар",
            ),
          ],
        ),
      ],
    );
  }
}

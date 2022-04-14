import 'package:flutter/material.dart';

class ForecastIndicatorWidget extends StatelessWidget {
  const ForecastIndicatorWidget({
    required this.forecastIndicatorName,
    required this.forecastIndicatorValue,
    Key? key,
  }) : super(key: key);

  final String forecastIndicatorName;
  final String forecastIndicatorValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          forecastIndicatorName,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          forecastIndicatorValue,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

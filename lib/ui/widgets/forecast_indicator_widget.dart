import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather/app_theme/app_theme.dart';

class ForecastIndicatorWidget extends StatelessWidget {
  const ForecastIndicatorWidget({
    required this.forecastIndicatorName,
    required this.forecastIndicatorValue,
    required this.isLoading,
    Key? key,
  }) : super(key: key);

  final String forecastIndicatorName;
  final String forecastIndicatorValue;
  final bool isLoading;

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
        isLoading
            ? Shimmer(
                gradient: AppColors.shimmerGradient,
                child: Container(
                  height: 12,
                  width: 85,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
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

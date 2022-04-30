import 'package:flutter/material.dart';

abstract class AppColors {
  static Color blue = const Color(0xff30A2C5);
  static Color black = const Color(0xff00242F);

  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xD1D1E3FF),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
}

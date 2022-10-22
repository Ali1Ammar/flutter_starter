import 'package:flutter/material.dart';

class Themeing {
  static const primaryColor = Colors.red;
  static final lightTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
    ),
  );

  static final darkTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:starter/src/config/style.dart';

class Themeing {
  static final lightTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Coloring.primaryColor,
    ),
  );

  static final darkTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Coloring.primaryColor,
      brightness: Brightness.dark,
    ),
  );
}

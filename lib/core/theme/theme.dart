import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Palette.backgroundDark,
      primaryColor: Palette.primary,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: Palette.primary,
        secondary: Palette.primaryLight,
        surface: Palette.surfaceDark,
        error: Palette.error,
      ),
      cardColor: Palette.surfaceDark,
      dividerColor: Palette.borderDark,
    );
  }

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Palette.backgroundLight,
      primaryColor: Palette.primary,
      colorScheme: const ColorScheme.light().copyWith(
        primary: Palette.primary,
        secondary: Palette.primaryLight,
        surface: Palette.surfaceLight,
        error: Palette.error,
      ),
      cardColor: Palette.surfaceLight,
      dividerColor: Palette.borderLight,
    );
  }
}

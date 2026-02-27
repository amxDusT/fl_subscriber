import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static const SystemUiOverlayStyle darkOverlay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Palette.backgroundDark,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const SystemUiOverlayStyle lightOverlay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Palette.backgroundLight,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Palette.backgroundDark,
      colorScheme: const ColorScheme.dark(
        surface: Palette.surfaceDark,
        onSurface: Palette.textPrimaryDark,
        primary: Palette.textPrimaryDark,
        onPrimary: Palette.backgroundDark,
        secondary: Palette.textSecondaryDark,
        error: Palette.error,
        outline: Palette.borderDark,
      ),
      textTheme: _textTheme(Palette.textPrimaryDark, Palette.textSecondaryDark),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: Palette.textPrimaryDark, size: 22),
        titleTextStyle: TextStyle(
          color: Palette.textPrimaryDark,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
      ),
      cardTheme: CardThemeData(
        color: Palette.surfaceDark,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Palette.surfaceDark,
        surfaceTintColor: Colors.transparent,
        modalBarrierColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        showDragHandle: true,
        dragHandleColor: Palette.textMutedDark,
        dragHandleSize: Size(36, 4),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.textPrimaryDark,
          foregroundColor: Palette.backgroundDark,
          elevation: 0,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Palette.textPrimaryDark,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        iconColor: Palette.textSecondaryDark,
        textColor: Palette.textPrimaryDark,
        titleTextStyle: TextStyle(
          color: Palette.textPrimaryDark,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.2,
        ),
        subtitleTextStyle: TextStyle(
          color: Palette.textSecondaryDark,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Palette.textSecondaryDark,
        size: 22,
      ),
      dividerTheme: const DividerThemeData(
        color: Palette.borderDark,
        thickness: 0.5,
        space: 0,
      ),
      splashFactory: InkSplash.splashFactory,
      splashColor: Palette.elevatedDark,
      highlightColor: Colors.transparent,
    );
  }

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Palette.backgroundLight,
      colorScheme: const ColorScheme.light(
        surface: Palette.surfaceLight,
        onSurface: Palette.textPrimaryLight,
        primary: Palette.textPrimaryLight,
        onPrimary: Palette.backgroundLight,
        secondary: Palette.textSecondaryLight,
        error: Palette.error,
        outline: Palette.borderLight,
      ),
      textTheme: _textTheme(
        Palette.textPrimaryLight,
        Palette.textSecondaryLight,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: Palette.textPrimaryLight, size: 22),
        titleTextStyle: TextStyle(
          color: Palette.textPrimaryLight,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
      ),
      cardTheme: CardThemeData(
        color: Palette.surfaceLight,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Palette.backgroundLight,
        surfaceTintColor: Colors.transparent,
        modalBarrierColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        showDragHandle: true,
        dragHandleColor: Palette.textMutedLight,
        dragHandleSize: Size(36, 4),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.textPrimaryLight,
          foregroundColor: Palette.backgroundLight,
          elevation: 0,

          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Palette.textPrimaryLight,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        iconColor: Palette.textSecondaryLight,
        textColor: Palette.textPrimaryLight,
        titleTextStyle: TextStyle(
          color: Palette.textPrimaryLight,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.2,
        ),
        subtitleTextStyle: TextStyle(
          color: Palette.textSecondaryLight,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Palette.textSecondaryLight,
        size: 22,
      ),
      dividerTheme: const DividerThemeData(
        color: Palette.borderLight,
        thickness: 0.5,
        space: 0,
      ),
      splashFactory: InkSplash.splashFactory,
      splashColor: Palette.elevatedLight,
      highlightColor: Colors.transparent,
    );
  }

  static TextTheme _textTheme(Color primary, Color secondary) {
    return TextTheme(
      headlineLarge: TextStyle(
        color: primary,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        height: 1.2,
      ),
      headlineMedium: TextStyle(
        color: primary,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
        height: 1.3,
      ),
      titleLarge: TextStyle(
        color: primary,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      titleMedium: TextStyle(
        color: primary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      titleSmall: TextStyle(
        color: secondary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.1,
      ),
      bodyLarge: TextStyle(
        color: primary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.2,
        height: 1.4,
      ),
      bodyMedium: TextStyle(
        color: primary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.1,
        height: 1.4,
      ),
      bodySmall: TextStyle(
        color: secondary,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.4,
      ),
      labelLarge: TextStyle(
        color: primary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      labelMedium: TextStyle(
        color: secondary,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      labelSmall: TextStyle(
        color: secondary,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({required this.elevated, required this.textMuted});

  final Color elevated;
  final Color textMuted;

  @override
  AppColors copyWith({Color? elevated, Color? textMuted}) {
    return AppColors(
      elevated: elevated ?? this.elevated,
      textMuted: textMuted ?? this.textMuted,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      elevated: Color.lerp(elevated, other.elevated, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
    );
  }
}

extension AppColorsX on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

class Palette {
  Palette._();

  // ===== Backgrounds =====
  static const Color backgroundDark = Color(0xFF0D0D0D);
  static const Color backgroundLight = Color(0xFFFFFFFF);

  // ===== Surface (Cards, Grouped Sections) =====
  static const Color surfaceDark = Color(0xFF1A1A1A);
  static const Color surfaceLight = Color(0xFFF5F5F5);

  // ===== Elevated Surface (Active States, Hover) =====
  static const Color elevatedDark = Color(0xFF242424);
  static const Color elevatedLight = Color(0xFFEBEBEB);

  // ===== Borders =====
  static const Color borderDark = Color(0xFF2A2A2A);
  static const Color borderLight = Color(0xFFE0E0E0);

  // ===== Text - Dark Mode =====
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFF8E8E93);
  static const Color textMutedDark = Color(0xFF636366);

  // ===== Text - Light Mode =====
  static const Color textPrimaryLight = Color(0xFF000000);
  static const Color textSecondaryLight = Color(0xFF6E6E73);
  static const Color textMutedLight = Color(0xFFAEAEB2);

  // ===== Status Colors =====
  static const Color success = Color(0xFF34C759);
  static const Color warning = Color(0xFFFF9F0A);
  static const Color error = Color(0xFFFF3B30);
}

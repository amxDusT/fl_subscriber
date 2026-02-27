import 'package:fl_subscriber/core/providers/preferences_provider.dart';
import 'package:fl_subscriber/core/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/app_controller.g.dart';

const _keyThemeMode = 'theme_mode';
const _keyLocale = 'locale';
const _keyHapticFeedback = 'haptic_feedback';

@Riverpod(keepAlive: true)
class AppController extends _$AppController {
  @override
  AppState build() {
    final prefs = ref.read(sharedPreferencesProvider);

    final savedTheme = prefs.getString(_keyThemeMode);
    final themeMode = switch (savedTheme) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.dark,
    };

    final savedLocale = prefs.getString(_keyLocale);
    final locale = savedLocale != null ? Locale(savedLocale) : const Locale('en');

    final hapticFeedback = prefs.getBool(_keyHapticFeedback) ?? true;

    return AppState(locale: locale, themeMode: themeMode, hapticFeedback: hapticFeedback);
  }

  void setThemeMode(ThemeMode themeMode) {
    state = state.copyWith(themeMode: themeMode);
    ref.read(sharedPreferencesProvider).setString(
          _keyThemeMode,
          themeMode == ThemeMode.light ? 'light' : 'dark',
        );
  }

  void setLocale(Locale locale) {
    state = state.copyWith(locale: locale);
    ref
        .read(sharedPreferencesProvider)
        .setString(_keyLocale, locale.languageCode);
  }

  void setHapticFeedback(bool enabled) {
    state = state.copyWith(hapticFeedback: enabled);
    ref.read(sharedPreferencesProvider).setBool(_keyHapticFeedback, enabled);
  }
}

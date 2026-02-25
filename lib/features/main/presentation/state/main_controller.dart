import 'package:fl_subscriber/core/providers/preferences_provider.dart';
import 'package:fl_subscriber/features/main/presentation/state/main_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/main_controller.g.dart';

const _keyThemeMode = 'theme_mode';
const _keyLocale = 'locale';

@Riverpod(keepAlive: true)
class MainController extends _$MainController {
  @override
  MainState build() {
    final prefs = ref.read(sharedPreferencesProvider);

    final savedTheme = prefs.getString(_keyThemeMode);
    final themeMode = switch (savedTheme) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.dark,
    };

    final savedLocale = prefs.getString(_keyLocale);
    final locale = savedLocale != null ? Locale(savedLocale) : const Locale('en');

    return MainState(locale: locale, themeMode: themeMode);
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
}

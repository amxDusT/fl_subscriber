import 'package:fl_subscriber/features/main/presentation/state/main_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/main_controller.g.dart';

@Riverpod(keepAlive: true)
class MainController extends _$MainController {
  @override
  MainState build() {
    return const MainState();
  }

  void setThemeMode(ThemeMode themeMode) {
    state = state.copyWith(themeMode: themeMode);
  }

  void setLocale(Locale locale) {
    state = state.copyWith(locale: locale);
  }
}

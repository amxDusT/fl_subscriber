import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(Locale('en')) Locale locale,
    @Default(ThemeMode.dark) ThemeMode themeMode,
    @Default(true) bool hapticFeedback,
  }) = _AppState;
}

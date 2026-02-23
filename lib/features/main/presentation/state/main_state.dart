import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(Locale('en')) Locale locale,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _MainState;
}

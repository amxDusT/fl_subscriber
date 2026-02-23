import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  Future<void> build() async {
    await _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}

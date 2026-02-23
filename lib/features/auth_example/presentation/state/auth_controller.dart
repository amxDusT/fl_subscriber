// features/auth/presentation/state/auth_controller.dart

import 'package:fl_subscriber/features/auth_example/domain/entities/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:fl_subscriber/features/auth_example/domain/providers/login_provider.dart';

part 'generated/auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<AuthData?> build() async {
    return null; // initial state
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final isLogged = await ref.read(
        loginProvider(email: email, password: password).future,
      );

      if (!isLogged) {
        throw Exception('Login failed');
      }

      return const AuthData(
        token: 'dummy_token',
        refreshToken: 'dummy_refresh_token',
      );
    });
  }
}

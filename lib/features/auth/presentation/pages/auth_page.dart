import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_subscriber/core/widgets/consumer_page.dart';
import 'package:fl_subscriber/features/auth/presentation/state/auth_controller.dart';

class AuthPage extends ConsumerPage<AuthControllerProvider> {
  const AuthPage({super.key});

  @override
  AuthControllerProvider get provider => authControllerProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(provider);
    return Scaffold(
      appBar: AppBar(title: const Text('Auth Page')),
      body: Center(
        child: authState.when(
          data: (authData) {
            if (authData != null) {
              return Text('Logged in with token: ${authData.token}');
            } else {
              return const Text('Not logged in');
            }
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ref
              .read(authControllerProvider.notifier)
              .login('user@example.com', 'password');
        },
        child: const Icon(Icons.login),
      ),
    );
  }
}

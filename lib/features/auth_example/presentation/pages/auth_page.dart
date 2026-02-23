import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_subscriber/features/auth_example/presentation/state/auth_controller.dart';
import 'package:fl_subscriber/core/l10n/app_localizations.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.authPage)),
      body: Center(
        child: authState.when(
          data: (authData) {
            if (authData != null) {
              return Text(l10n.loggedInWithToken(authData.token));
            } else {
              return Text(l10n.notLoggedIn);
            }
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text(l10n.errorMessage(error.toString())),
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

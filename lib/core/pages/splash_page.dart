import 'package:fl_subscriber/core/routes/route_names.dart';
import 'package:fl_subscriber/core/state/splash_controller.dart';
import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashControllerProvider, (previous, next) {
      if (!context.mounted) return;
      if (next.hasValue) {
        context.goNamed(RouteNames.home);
      }
    });

    final splashState = ref.watch(splashControllerProvider);
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: splashState.when(
          loading: () => const CircularProgressIndicator(),
          data: (_) => const CircularProgressIndicator(),
          error: (error, _) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n?.somethingWentWrong(error.toString()) ??
                    'Something went wrong: $error',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(splashControllerProvider),
                child: Text(l10n?.retry ?? 'Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fl_subscriber/core/routes/routes.dart';
import 'package:fl_subscriber/core/theme/theme.dart';
import 'package:fl_subscriber/features/main/presentation/state/main_controller.dart';
import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainState = ref.watch(mainControllerProvider);
    final goRouter = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: mainState.themeMode,
      locale: mainState.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

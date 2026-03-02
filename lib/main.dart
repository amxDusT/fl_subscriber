import 'dart:io';

import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/providers/notification_provider.dart';
import 'package:fl_subscriber/core/providers/preferences_provider.dart';
import 'package:fl_subscriber/core/routes/routes.dart';
import 'package:fl_subscriber/core/state/app_controller.dart';
import 'package:fl_subscriber/core/theme/theme.dart';
import 'package:fl_subscriber/core/utils/haptic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  tz.initializeTimeZones();

  final prefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
  );
  await container.read(notificationServiceProvider).initialize();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appControllerProvider);
    final goRouter = ref.watch(routerProvider);
    final isDark = appState.themeMode == ThemeMode.dark;

    return HapticScope(
      enabled: appState.hapticFeedback,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: isDark ? AppTheme.darkOverlay : AppTheme.lightOverlay,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: goRouter,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: appState.themeMode,
          locale: appState.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}

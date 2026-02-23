import 'package:fl_subscriber/features/main/presentation/state/main_controller.dart';
import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainState = ref.watch(mainControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.appearance,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RadioGroup<ThemeMode>(
              groupValue: mainState.themeMode,
              onChanged: (value) {
                if (value != null) {
                  ref.read(mainControllerProvider.notifier).setThemeMode(value);
                }
              },
              child: Column(
                children: ThemeMode.values
                    .map(
                      (mode) => RadioListTile<ThemeMode>(
                        title: Text(switch (mode) {
                          ThemeMode.system => l10n.themeSystem,
                          ThemeMode.light => l10n.themeLight,
                          ThemeMode.dark => l10n.themeDark,
                        }),
                        value: mode,
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.language,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => ref
                  .read(mainControllerProvider.notifier)
                  .setLocale(const Locale('en')),
              child: Text(l10n.languageEnglish),
            ),
            ElevatedButton(
              onPressed: () => ref
                  .read(mainControllerProvider.notifier)
                  .setLocale(const Locale('es')),
              child: Text(l10n.languageSpanish),
            ),
            ElevatedButton(
              onPressed: () => ref
                  .read(mainControllerProvider.notifier)
                  .setLocale(const Locale('it')),
              child: Text(l10n.languageItalian),
            ),
          ],
        ),
      ),
    );
  }
}

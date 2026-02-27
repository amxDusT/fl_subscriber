import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/state/app_controller.dart';
import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsSheet extends ConsumerWidget {
  const SettingsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appControllerProvider);
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Text(l10n.settings, style: theme.textTheme.headlineLarge),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close_rounded, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 36),

        _SectionLabel(label: l10n.appearance),
        const SizedBox(height: 10),
        _ThemeToggle(
          isDark: isDark,
          onChanged: (dark) {
            ref
                .read(appControllerProvider.notifier)
                .setThemeMode(dark ? ThemeMode.dark : ThemeMode.light);
          },
        ),

        const SizedBox(height: 28),

        _SectionLabel(label: l10n.language),
        const SizedBox(height: 10),
        _SettingsTile(
          icon: Icons.language_rounded,
          title: _localeLabel(appState.locale, l10n),
          onTap: () => _showLanguageSheet(context, ref, appState.locale, l10n),
        ),

        const SizedBox(height: 32),
      ],
    );
  }

  void _showLanguageSheet(
    BuildContext context,
    WidgetRef ref,
    Locale currentLocale,
    AppLocalizations l10n,
  ) {
    final locales = AppLocalizations.supportedLocales
        .map((locale) => (locale, _localeLabel(locale, l10n)))
        .toList();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        final theme = Theme.of(context);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
                  child: Text(
                    l10n.language,
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                ...locales.map((entry) {
                  final selected = entry.$1 == currentLocale;
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    title: Text(
                      entry.$2,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                    trailing: selected
                        ? Icon(
                            Icons.check_rounded,
                            size: 20,
                            color: theme.colorScheme.onSurface,
                          )
                        : null,
                    onTap: () {
                      ref
                          .read(appControllerProvider.notifier)
                          .setLocale(entry.$1);
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  String _localeLabel(Locale locale, AppLocalizations l10n) {
    return switch (locale.languageCode) {
      'es' => l10n.languageSpanish,
      'it' => l10n.languageItalian,
      _ => l10n.languageEnglish,
    };
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        letterSpacing: 0.8,
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  const _ThemeToggle({required this.isDark, required this.onChanged});
  final bool isDark;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ThemeOption(
              icon: Icons.light_mode_rounded,
              label: AppLocalizations.of(context)!.themeLight,
              selected: !isDark,
              onTap: () => onChanged(false),
            ),
          ),
          Expanded(
            child: _ThemeOption(
              icon: Icons.dark_mode_rounded,
              label: AppLocalizations.of(context)!.themeDark,
              selected: isDark,
              onTap: () => onChanged(true),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  const _ThemeOption({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final selectedBg = isDark ? Palette.elevatedDark : Palette.elevatedLight;
    final selectedFg = theme.colorScheme.onSurface;
    final unselectedFg = isDark
        ? Palette.textMutedDark
        : Palette.textMutedLight;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: selected ? selectedBg : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: selected ? selectedFg : unselectedFg),
            const SizedBox(width: 8),
            Text(
              label,
              style: theme.textTheme.titleMedium?.copyWith(
                color: selected ? selectedFg : unselectedFg,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, size: 22),
              const SizedBox(width: 14),
              Expanded(
                child: Text(title, style: theme.textTheme.bodyLarge),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: theme.brightness == Brightness.dark
                    ? Palette.textMutedDark
                    : Palette.textMutedLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

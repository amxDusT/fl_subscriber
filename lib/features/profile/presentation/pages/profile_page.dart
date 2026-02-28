import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/widgets/app_bottom_sheet.dart';
import 'package:fl_subscriber/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        _ProfileTile(
          icon: Icons.settings_rounded,
          title: l10n.settings,
          onTap: () => _openSettings(context),
        ),
      ],
    );
  }

  void _openSettings(BuildContext context) {
    showAppFullBottomSheet(
      context: context,
      builder: (_) => const SettingsSheet(),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
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

import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/widgets/button.dart';
import 'package:flutter/material.dart';

/// Shows a confirmation bottom sheet with a title, message, and two buttons.
///
/// Returns `true` if the CTA was tapped, `false` if cancelled.
Future<bool?> showAppConfirmDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String ctaLabel,
  IconData? ctaIcon = Icons.arrow_forward_ios_rounded,
}) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;
  final secondary = isDark
      ? Palette.textSecondaryDark
      : Palette.textSecondaryLight;
  final l10n = AppLocalizations.of(context)!;

  return showModalBottomSheet<bool>(
    context: context,
    builder: (ctx) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: theme.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(color: secondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: Text(l10n.cancel),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  label: ctaLabel,
                  icon: ctaIcon,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/widgets/app_bottom_sheet.dart';
import 'package:fl_subscriber/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  final l10n = AppLocalizations.of(context)!;

  return showAppBottomSheet<bool>(
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
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => ctx.pop(false),
                  child: Text(l10n.cancel),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton(
                  onPressed: () => ctx.pop(true),
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

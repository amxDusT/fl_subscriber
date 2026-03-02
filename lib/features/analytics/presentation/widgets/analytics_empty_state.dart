import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:flutter/material.dart';

class AnalyticsEmptyState extends StatelessWidget {
  const AnalyticsEmptyState({super.key, this.isFiltered = false});

  final bool isFiltered;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.bar_chart_rounded,
              size: 80,
              color: context.appColors.textMuted,
            ),
            const SizedBox(height: 24),
            Text(
              isFiltered ? l10n.noDataForPeriod : l10n.noAnalyticsData,
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              isFiltered
                  ? l10n.noDataForPeriodDescription
                  : l10n.noAnalyticsDataDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

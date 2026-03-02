import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/features/analytics/domain/entities/analytics_data.dart';
import 'package:fl_subscriber/features/analytics/presentation/state/analytics_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyticsFilterChips extends ConsumerWidget {
  const AnalyticsFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(analyticsPeriodControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    final periods = [
      (AnalyticsPeriod.threeMonths, l10n.periodThreeMonths),
      (AnalyticsPeriod.sixMonths, l10n.periodSixMonths),
      (AnalyticsPeriod.oneYear, l10n.periodOneYear),
      (AnalyticsPeriod.allTime, l10n.periodAllTime),
    ];

    return Row(
      children: periods.map((entry) {
        final (period, label) = entry;
        return Padding(
          padding: EdgeInsets.only(right: period != AnalyticsPeriod.allTime ? 8 : 0),
          child: _FilterChip(
            label: label,
            selected: selected == period,
            onTap: () => ref
                .read(analyticsPeriodControllerProvider.notifier)
                .setPeriod(period),
          ),
        );
      }).toList(),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? theme.colorScheme.onSurface.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            color: selected
                ? theme.colorScheme.onSurface
                : context.appColors.textMuted,
          ),
        ),
      ),
    );
  }
}

import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/features/analytics/domain/entities/analytics_data.dart';
import 'package:fl_subscriber/features/analytics/presentation/widgets/category_donut_chart.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:flutter/material.dart';

class CategoryBreakdownList extends StatelessWidget {
  const CategoryBreakdownList({
    super.key,
    required this.categories,
    required this.totalMonthly,
  });

  final List<CategorySpending> categories;
  final double totalMonthly;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: categories.map((cat) {
        return _CategoryRow(
          category: cat,
          totalMonthly: totalMonthly,
          l10n: l10n,
        );
      }).toList(),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  const _CategoryRow({
    required this.category,
    required this.totalMonthly,
    required this.l10n,
  });

  final CategorySpending category;
  final double totalMonthly;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = categoryChartColors[category.categoryKey] ??
        categoryChartColors['other']!;
    final fraction = totalMonthly > 0 ? category.monthlyAmount / totalMonthly : 0.0;

    final categoryEnum =
        ServiceCategory.values.where((c) => c.name == category.categoryKey);
    final icon = categoryEnum.isNotEmpty
        ? categoryEnum.first.icon
        : Icons.more_horiz_rounded;
    final label = categoryEnum.isNotEmpty
        ? categoryEnum.first.localizedLabel(l10n)
        : category.categoryKey;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 18, color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${category.subscriptionCount} ${category.subscriptionCount == 1 ? 'sub' : 'subs'}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: context.appColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '€${category.monthlyAmount.toStringAsFixed(2)}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    l10n.ofTotal(category.percentage.toStringAsFixed(1)),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: fraction,
              backgroundColor: theme.colorScheme.outline,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 3,
            ),
          ),
        ],
      ),
    );
  }
}

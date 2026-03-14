import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/features/analytics/domain/entities/analytics_data.dart';
import 'package:fl_subscriber/features/analytics/presentation/state/analytics_controller.dart';
import 'package:fl_subscriber/features/analytics/presentation/widgets/analytics_empty_state.dart';
import 'package:fl_subscriber/features/analytics/presentation/widgets/analytics_filter_chips.dart';
import 'package:fl_subscriber/features/analytics/presentation/widgets/category_breakdown_list.dart';
import 'package:fl_subscriber/features/analytics/presentation/widgets/category_donut_chart.dart';
import 'package:fl_subscriber/features/analytics/presentation/widgets/monthly_trend_chart.dart';
import 'package:fl_subscriber/features/analytics/presentation/widgets/stat_card.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tr_ui/tr_ui.dart';

class AnalyticsContent extends ConsumerWidget {
  const AnalyticsContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscriptionsAsync = ref.watch(subscriptionControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    return subscriptionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
        child: Text(l10n.somethingWentWrong(e.toString())),
      ),
      data: (subscriptions) {
        if (subscriptions.isEmpty) {
          return const AnalyticsEmptyState();
        }

        final analytics = ref.watch(analyticsDataProvider);
        if (analytics == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final period = ref.watch(analyticsPeriodControllerProvider);
        final hasDataForPeriod = analytics.activeCount > 0 ||
            analytics.monthlyTrend.any((p) => p.totalAmount > 0);

        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: AnalyticsFilterChips(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: hasDataForPeriod
                  ? _AnalyticsBody(analytics: analytics, l10n: l10n, period: period)
                  : AnalyticsEmptyState(
                      isFiltered: period != AnalyticsPeriod.allTime,
                    ),
            ),
          ],
        );
      },
    );
  }
}

class _AnalyticsBody extends StatelessWidget {
  const _AnalyticsBody({
    required this.analytics,
    required this.l10n,
    required this.period,
  });

  final AnalyticsData analytics;
  final AppLocalizations l10n;
  final AnalyticsPeriod period;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary stat cards (2x2 grid)
          Row(
            children: [
              Expanded(
                child: StatCard(
                  label: l10n.monthlyCost,
                  value: '€${analytics.totalMonthly.toStringAsFixed(2)}',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: StatCard(
                  label: l10n.yearlyProjected,
                  value: '€${analytics.totalYearly.toStringAsFixed(0)}',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  label: l10n.activeCount,
                  value: '${analytics.activeCount}',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: StatCard(
                  label: l10n.averagePerSub,
                  value:
                      '€${analytics.averagePerSubscription.toStringAsFixed(2)}',
                ),
              ),
            ],
          ),

          // Donut chart
          if (analytics.categoryBreakdown.isNotEmpty) ...[
            const SizedBox(height: 36),
            SectionLabel(label: l10n.spendingByCategory),
            const SizedBox(height: 20),
            CategoryDonutChart(
              categories: analytics.categoryBreakdown,
              totalMonthly: analytics.totalMonthly,
              currency: 'EUR',
            ),
          ],

          // Bar chart
          if (analytics.monthlyTrend.length > 1 &&
              period != AnalyticsPeriod.allTime) ...[
            const SizedBox(height: 36),
            SectionLabel(label: l10n.monthlyTrend),
            const SizedBox(height: 20),
            MonthlyTrendChart(
              dataPoints: analytics.monthlyTrend,
              currency: 'EUR',
            ),
          ],

          // Category breakdown list
          if (analytics.categoryBreakdown.isNotEmpty) ...[
            const SizedBox(height: 36),
            SectionLabel(label: l10n.breakdown),
            const SizedBox(height: 16),
            CategoryBreakdownList(
              categories: analytics.categoryBreakdown,
              totalMonthly: analytics.totalMonthly,
            ),
          ],
        ],
      ),
    );
  }
}

import 'package:fl_subscriber/features/analytics/domain/entities/analytics_data.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/subscription_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/analytics_controller.g.dart';

@riverpod
class AnalyticsPeriodController extends _$AnalyticsPeriodController {
  @override
  AnalyticsPeriod build() => AnalyticsPeriod.allTime;

  void setPeriod(AnalyticsPeriod period) {
    state = period;
  }
}

@riverpod
AnalyticsData? analyticsData(Ref ref) {
  final subscriptions = ref.watch(subscriptionControllerProvider).value;
  if (subscriptions == null) return null;
  final period = ref.watch(analyticsPeriodControllerProvider);
  return _computeAnalytics(subscriptions, period);
}

AnalyticsData _computeAnalytics(
  List<Subscription> allSubscriptions,
  AnalyticsPeriod period,
) {
  final now = DateTime.now();
  final periodStart = _periodStart(period, now, allSubscriptions);
  final periodEnd = now;

  // Filter subscriptions that were active during the period
  final relevantSubs = allSubscriptions.where((s) {
    final startedBeforePeriodEnd =
        s.startDate.isBefore(periodEnd) || s.startDate.isAtSameMomentAs(periodEnd);
    final endedAfterPeriodStart =
        s.endDate == null || s.endDate!.isAfter(periodStart) || s.endDate!.isAtSameMomentAs(periodStart);
    return startedBeforePeriodEnd && endedAfterPeriodStart;
  }).toList();

  // Active subscriptions (currently active)
  final activeSubs = relevantSubs.where((s) => s.isActive).toList();

  // Summary stats (based on currently active subs)
  final totalMonthly =
      activeSubs.fold(0.0, (sum, s) => sum + s.amount / s.frequency.months);
  final totalYearly = totalMonthly * 12;
  final activeCount = activeSubs.length;
  final avgPerSub = activeCount > 0 ? totalMonthly / activeCount : 0.0;

  // Category breakdown (based on currently active subs)
  final categoryMap = <String, _CategoryAccumulator>{};
  for (final s in activeSubs) {
    final key = s.category ?? 'other';
    categoryMap.putIfAbsent(key, () => _CategoryAccumulator());
    categoryMap[key]!.monthlyAmount += s.amount / s.frequency.months;
    categoryMap[key]!.count++;
  }

  final categoryBreakdown = categoryMap.entries.map((e) {
    return CategorySpending(
      categoryKey: e.key,
      monthlyAmount: e.value.monthlyAmount,
      percentage: totalMonthly > 0 ? (e.value.monthlyAmount / totalMonthly) * 100 : 0,
      subscriptionCount: e.value.count,
    );
  }).toList()
    ..sort((a, b) => b.monthlyAmount.compareTo(a.monthlyAmount));

  // Monthly trend (includes expired subs for the months they were active)
  final monthlyTrend = _computeMonthlyTrend(
    relevantSubs,
    periodStart,
    periodEnd,
  );

  return AnalyticsData(
    totalMonthly: totalMonthly,
    totalYearly: totalYearly,
    activeCount: activeCount,
    averagePerSubscription: avgPerSub,
    categoryBreakdown: categoryBreakdown,
    monthlyTrend: monthlyTrend,
    period: period,
  );
}

DateTime _periodStart(
  AnalyticsPeriod period,
  DateTime now,
  List<Subscription> subscriptions,
) {
  return switch (period) {
    AnalyticsPeriod.threeMonths => DateTime(now.year, now.month - 2, 1),
    AnalyticsPeriod.sixMonths => DateTime(now.year, now.month - 5, 1),
    AnalyticsPeriod.oneYear => DateTime(now.year, now.month - 11, 1),
    AnalyticsPeriod.allTime => subscriptions.isEmpty
        ? DateTime(now.year, now.month, 1)
        : subscriptions
            .map((s) => s.startDate)
            .reduce((a, b) => a.isBefore(b) ? a : b),
  };
}

List<MonthlyDataPoint> _computeMonthlyTrend(
  List<Subscription> subscriptions,
  DateTime periodStart,
  DateTime periodEnd,
) {
  final points = <MonthlyDataPoint>[];
  var current = DateTime(periodStart.year, periodStart.month, 1);
  final end = DateTime(periodEnd.year, periodEnd.month, 1);

  while (!current.isAfter(end)) {
    final monthStart = current;
    final monthEnd = DateTime(current.year, current.month + 1, 0);

    double total = 0;
    for (final s in subscriptions) {
      final activeInMonth = (s.startDate.isBefore(monthEnd) ||
              s.startDate.isAtSameMomentAs(monthEnd)) &&
          (s.endDate == null ||
              s.endDate!.isAfter(monthStart) ||
              s.endDate!.isAtSameMomentAs(monthStart));
      if (activeInMonth) {
        total += s.amount / s.frequency.months;
      }
    }

    points.add(MonthlyDataPoint(month: monthStart, totalAmount: total));
    current = DateTime(current.year, current.month + 1, 1);
  }

  return points;
}

class _CategoryAccumulator {
  double monthlyAmount = 0;
  int count = 0;
}

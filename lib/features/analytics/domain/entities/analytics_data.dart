import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/analytics_data.freezed.dart';

enum AnalyticsPeriod {
  threeMonths,
  sixMonths,
  oneYear,
  allTime,
}

@freezed
abstract class CategorySpending with _$CategorySpending {
  const factory CategorySpending({
    required String categoryKey,
    required double monthlyAmount,
    required double percentage,
    required int subscriptionCount,
  }) = _CategorySpending;
}

@freezed
abstract class MonthlyDataPoint with _$MonthlyDataPoint {
  const factory MonthlyDataPoint({
    required DateTime month,
    required double totalAmount,
  }) = _MonthlyDataPoint;
}

@freezed
abstract class AnalyticsData with _$AnalyticsData {
  const factory AnalyticsData({
    required double totalMonthly,
    required double totalYearly,
    required int activeCount,
    required double averagePerSubscription,
    required List<CategorySpending> categoryBreakdown,
    required List<MonthlyDataPoint> monthlyTrend,
    required AnalyticsPeriod period,
  }) = _AnalyticsData;
}

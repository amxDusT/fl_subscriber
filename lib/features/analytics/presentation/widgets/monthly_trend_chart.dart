import 'package:fl_chart/fl_chart.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/features/analytics/domain/entities/analytics_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthlyTrendChart extends StatelessWidget {
  const MonthlyTrendChart({
    super.key,
    required this.dataPoints,
    required this.currency,
  });

  final List<MonthlyDataPoint> dataPoints;
  final String currency;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (dataPoints.isEmpty) return const SizedBox.shrink();

    final maxY = dataPoints
        .map((p) => p.totalAmount)
        .reduce((a, b) => a > b ? a : b);
    final interval = _computeInterval(maxY);

    final barColor = theme.colorScheme.onSurface.withValues(alpha: 0.25);
    // Determine bar width based on number of data points
    final barWidth = dataPoints.length <= 3
        ? 40.0
        : dataPoints.length <= 6
            ? 24.0
            : 14.0;

    // Show fewer labels when many months
    final labelInterval = dataPoints.length > 6 ? 2 : 1;

    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: List.generate(dataPoints.length, (i) {
            return BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: dataPoints[i].totalAmount,
                  color: barColor,
                  width: barWidth,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(4)),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: false,
                  ),
                ),
              ],
            );
          }),
          alignment: BarChartAlignment.spaceAround,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= dataPoints.length) {
                    return const SizedBox.shrink();
                  }
                  if (index % labelInterval != 0 &&
                      index != dataPoints.length - 1) {
                    return const SizedBox.shrink();
                  }
                  final month = dataPoints[index].month;
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      DateFormat('MMM').format(month),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: isDark
                            ? Palette.textMutedDark
                            : Palette.textMutedLight,
                      ),
                    ),
                  );
                },
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: interval,
            getDrawingHorizontalLine: (value) => FlLine(
              color: isDark ? Palette.borderDark : Palette.borderLight,
              strokeWidth: 0.5,
            ),
          ),
          borderData: FlBorderData(show: false),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) =>
                  isDark ? Palette.surfaceDark : Palette.surfaceLight,
              tooltipPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '€${rod.toY.toStringAsFixed(2)}',
                  TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                );
              },
            ),
            touchCallback: (event, response) {},
          ),
          maxY: maxY * 1.15,
        ),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  double _computeInterval(double maxY) {
    if (maxY <= 0) return 1;
    final rough = maxY / 4;
    final magnitude = _pow10(rough.floor());
    return (rough / magnitude).ceil() * magnitude.toDouble();
  }

  int _pow10(int n) {
    if (n <= 0) return 1;
    final digits = n.toString().length - 1;
    int result = 1;
    for (int i = 0; i < digits; i++) {
      result *= 10;
    }
    return result;
  }
}

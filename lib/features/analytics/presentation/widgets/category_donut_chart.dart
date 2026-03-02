import 'package:fl_chart/fl_chart.dart';
import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/features/analytics/domain/entities/analytics_data.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:flutter/material.dart';

const Map<String, Color> categoryChartColors = {
  'entertainment': Color(0xFF5E7CE0),
  'productivity': Color(0xFF7EB8A0),
  'cloud': Color(0xFF6CA6CD),
  'ai': Color(0xFFAB82C5),
  'design': Color(0xFFE8917A),
  'development': Color(0xFF78B4A0),
  'social': Color(0xFF7AA3CC),
  'shopping': Color(0xFFDBA567),
  'fitness': Color(0xFFE07B7B),
  'education': Color(0xFF8CB4D8),
  'gaming': Color(0xFF9B8EC5),
  'news': Color(0xFF8DB89B),
  'finance': Color(0xFF70A898),
  'lifestyle': Color(0xFFD4A07A),
  'other': Color(0xFF9E9E9E),
};

class CategoryDonutChart extends StatefulWidget {
  const CategoryDonutChart({
    super.key,
    required this.categories,
    required this.totalMonthly,
    required this.currency,
  });

  final List<CategorySpending> categories;
  final double totalMonthly;
  final String currency;

  @override
  State<CategoryDonutChart> createState() => _CategoryDonutChartState();
}

class _CategoryDonutChartState extends State<CategoryDonutChart> {
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final centerLabel = _touchedIndex >= 0 && _touchedIndex < widget.categories.length
        ? _categoryLabel(widget.categories[_touchedIndex].categoryKey, l10n)
        : null;
    final centerAmount = _touchedIndex >= 0 && _touchedIndex < widget.categories.length
        ? widget.categories[_touchedIndex].monthlyAmount
        : widget.totalMonthly;

    return Column(
      children: [
        SizedBox(
          height: 240,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sections: _buildSections(),
                  centerSpaceRadius: 70,
                  sectionsSpace: 2,
                  borderData: FlBorderData(show: false),
                  pieTouchData: PieTouchData(
                    touchCallback: (event, response) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            response == null ||
                            response.touchedSection == null) {
                          _touchedIndex = -1;
                          return;
                        }
                        _touchedIndex =
                            response.touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                ),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${widget.currency == 'EUR' ? '€' : widget.currency}${centerAmount.toStringAsFixed(2)}',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (centerLabel != null)
                    Text(
                      centerLabel,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    )
                  else
                    Text(
                      l10n.perMonthAbbr,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: context.appColors.textMuted,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildLegend(context, l10n),
      ],
    );
  }

  List<PieChartSectionData> _buildSections() {
    return List.generate(widget.categories.length, (i) {
      final cat = widget.categories[i];
      final isTouched = i == _touchedIndex;
      final color = categoryChartColors[cat.categoryKey] ??
          categoryChartColors['other']!;

      return PieChartSectionData(
        value: cat.monthlyAmount,
        color: color,
        radius: isTouched ? 38 : 32,
        title: '',
        showTitle: false,
      );
    });
  }

  Widget _buildLegend(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);

    return Wrap(
      spacing: 16,
      runSpacing: 10,
      children: widget.categories.map((cat) {
        final color = categoryChartColors[cat.categoryKey] ??
            categoryChartColors['other']!;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              _categoryLabel(cat.categoryKey, l10n),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '€${cat.monthlyAmount.toStringAsFixed(0)}',
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

String _categoryLabel(String key, AppLocalizations l10n) {
  final category = ServiceCategory.values.where((c) => c.name == key);
  if (category.isNotEmpty) {
    return category.first.localizedLabel(l10n);
  }
  return key;
}

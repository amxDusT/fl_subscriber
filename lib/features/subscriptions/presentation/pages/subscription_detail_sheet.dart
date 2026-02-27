import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SubscriptionDetailSheet extends StatelessWidget {
  const SubscriptionDetailSheet({super.key, required this.subscription});

  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final muted = isDark ? Palette.textMutedDark : Palette.textMutedLight;
    final secondary =
        isDark ? Palette.textSecondaryDark : Palette.textSecondaryLight;
    final color = Color(subscription.colorValue);
    final icon = IconData(
      subscription.iconCodePoint,
      fontFamily: subscription.iconFontFamily,
    );
    final logoPath = isDark && subscription.logoAssetDark != null
        ? subscription.logoAssetDark!
        : subscription.logoAsset;
    final hasLogo = logoPath != null && logoPath.isNotEmpty;
    final l10n = AppLocalizations.of(context)!;
    final dateFormat = DateFormat('MMM d, yyyy');
    final renewals = _computeRenewals();

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.88,
      child: Column(
        children: [
          // Close handle
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  style: IconButton.styleFrom(
                    backgroundColor: theme.colorScheme.surface,
                    fixedSize: const Size(40, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.close_rounded, size: 18),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
              child: Column(
                children: [
                  // Service icon
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: hasLogo
                          ? Colors.transparent
                          : color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: hasLogo
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              logoPath,
                              width: 64,
                              height: 64,
                              fit: BoxFit.contain,
                            ),
                          )
                        : Icon(icon, size: 32, color: color),
                  ),
                  const SizedBox(height: 16),

                  // Service name
                  Text(
                    subscription.serviceName,
                    style: theme.textTheme.headlineMedium,
                  ),
                  if (subscription.planName != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subscription.planName!,
                      style: theme.textTheme.bodySmall?.copyWith(color: secondary),
                    ),
                  ],

                  const SizedBox(height: 32),

                  // Amount + frequency
                  Text(
                    '€${subscription.amount.toStringAsFixed(2)}',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subscription.frequency.localizedLabel(l10n),
                    style: theme.textTheme.bodySmall?.copyWith(color: secondary),
                  ),

                  const SizedBox(height: 32),

                  // Detail rows
                  _DetailRow(
                    label: l10n.nextPayment,
                    value: dateFormat.format(subscription.nextPaymentDate),
                    muted: muted,
                    theme: theme,
                  ),
                  _DetailRow(
                    label: l10n.startDate,
                    value: dateFormat.format(subscription.startDate),
                    muted: muted,
                    theme: theme,
                  ),
                  _DetailRow(
                    label: l10n.alert,
                    value: subscription.alertDaysBefore != null
                        ? l10n.alertDaysBefore(
                            subscription.alertDaysBefore.toString())
                        : l10n.alertOff,
                    muted: muted,
                    theme: theme,
                    valueIcon: subscription.alertDaysBefore != null
                        ? Icons.notifications_active_outlined
                        : null,
                  ),
                  if (subscription.category != null)
                    _DetailRow(
                      label: l10n.category,
                      value: ServiceCategory.values
                          .where((c) => c.name == subscription.category)
                          .firstOrNull
                          ?.localizedLabel(l10n) ?? subscription.category!,
                      muted: muted,
                      theme: theme,
                    ),

                  const SizedBox(height: 32),

                  // Renewals section
                  if (renewals.isNotEmpty) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          l10n.renewals.toUpperCase(),
                          style: theme.textTheme.labelMedium?.copyWith(
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...renewals.map(
                      (date) => _RenewalRow(
                        date: date,
                        amount: subscription.amount,
                        dateFormat: dateFormat,
                        muted: muted,
                        theme: theme,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Computes all past renewal dates from [startDate] up to today,
  /// sorted most recent first.
  List<DateTime> _computeRenewals() {
    final now = DateTime.now();
    final months = subscription.frequency.months;
    final renewals = <DateTime>[];
    var date = subscription.startDate;

    while (!date.isAfter(now)) {
      renewals.add(date);
      date = DateTime(date.year, date.month + months, date.day);
    }

    return renewals.reversed.toList();
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    required this.muted,
    required this.theme,
    this.valueIcon,
  });

  final String label;
  final String value;
  final Color muted;
  final ThemeData theme;
  final IconData? valueIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyLarge?.copyWith(color: muted),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (valueIcon != null) ...[
                Icon(valueIcon, size: 14, color: theme.colorScheme.onSurface),
                const SizedBox(width: 6),
              ],
              Text(
                value,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RenewalRow extends StatelessWidget {
  const _RenewalRow({
    required this.date,
    required this.amount,
    required this.dateFormat,
    required this.muted,
    required this.theme,
  });

  final DateTime date;
  final double amount;
  final DateFormat dateFormat;
  final Color muted;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateFormat.format(date),
            style: theme.textTheme.bodyLarge?.copyWith(color: muted),
          ),
          Text(
            '€${amount.toStringAsFixed(2)}',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

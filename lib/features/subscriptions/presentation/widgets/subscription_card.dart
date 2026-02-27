import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/utils/haptic.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SubscriptionCard extends ConsumerWidget {
  const SubscriptionCard({
    super.key,
    required this.subscription,
    this.onTap,
  });

  final Subscription subscription;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color = Color(subscription.colorValue);
    final icon = IconData(
      subscription.iconCodePoint,
      fontFamily: subscription.iconFontFamily,
    );

    final dateFormat = DateFormat('MMM d');
    final l10n = AppLocalizations.of(context)!;
    final frequencyLabel = subscription.frequency.localizedLabel(l10n);
    final subtitle = [
      if (subscription.planName != null) subscription.planName!,
      frequencyLabel,
    ].join(' · ');

    final logoPath = isDark && subscription.logoAssetDark != null
        ? subscription.logoAssetDark!
        : subscription.logoAsset;
    final hasLogo = logoPath != null && logoPath.isNotEmpty;
    final isExpired = !subscription.isActive;

    return Opacity(
      opacity: isExpired ? 0.6 : 1.0,
      child: Material(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap != null
              ? () {
                  triggerHaptic(ref);
                  onTap!();
                }
              : null,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: hasLogo
                        ? Colors.transparent
                        : color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: hasLogo
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            logoPath,
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Icon(icon, size: 20, color: color),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subscription.serviceName,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isDark
                              ? Palette.textSecondaryDark
                              : Palette.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '€${subscription.amount.toStringAsFixed(2)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    if (isExpired)
                      Text(
                        l10n.expired,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Palette.error.withValues(alpha: 0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    else
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (subscription.alertDaysBefore != null) ...[
                            Icon(
                              Icons.notifications_active_outlined,
                              size: 12,
                              color: isDark
                                  ? Palette.textMutedDark
                                  : Palette.textMutedLight,
                            ),
                            const SizedBox(width: 4),
                          ],
                          Text(
                            dateFormat
                                .format(subscription.nextPaymentDate),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isDark
                                  ? Palette.textMutedDark
                                  : Palette.textMutedLight,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

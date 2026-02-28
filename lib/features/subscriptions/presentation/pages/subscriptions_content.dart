import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/widgets/app_bottom_sheet.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:fl_subscriber/core/widgets/button.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/pages/add_subscription_sheet.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/pages/subscription_detail_sheet.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/subscription_controller.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/empty_state.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/subscription_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubscriptionsContent extends ConsumerStatefulWidget {
  const SubscriptionsContent({super.key});

  @override
  ConsumerState<SubscriptionsContent> createState() =>
      _SubscriptionsContentState();
}

class _SubscriptionsContentState extends ConsumerState<SubscriptionsContent> {
  bool _showExpired = false;

  @override
  Widget build(BuildContext context) {
    final subscriptionsAsync = ref.watch(subscriptionControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    return subscriptionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
        child: Text(l10n.somethingWentWrong(e.toString())),
      ),
      data: (allSubscriptions) {
        final active = allSubscriptions.where((s) => s.isActive).toList();
        final expired = allSubscriptions.where((s) => !s.isActive).toList();
        final hasAny = allSubscriptions.isNotEmpty;
        final current = _showExpired ? expired : active;

        return Stack(
          children: [
            Column(
              children: [
                if (hasAny) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        _FilterChip(
                          label: l10n.activeSubscriptions,
                          selected: !_showExpired,
                          count: active.length,
                          onTap: () => setState(() => _showExpired = false),
                        ),
                        const SizedBox(width: 8),
                        _FilterChip(
                          label: l10n.expiredSubscriptions,
                          selected: _showExpired,
                          count: expired.length,
                          onTap: () => setState(() => _showExpired = true),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                Expanded(
                  child: current.isEmpty
                      ? _showExpired
                            ? _ExpiredEmptyState(l10n: l10n)
                            : const SubscriptionEmptyState()
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 100),
                          itemCount: current.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final sub = current[index];
                            return SubscriptionCard(
                              subscription: sub,
                              onTap: () => _openDetailSheet(context, sub),
                            );
                          },
                        ),
                ),
              ],
            ),
            if (!_showExpired)
              Positioned(
                bottom: 24,
                left: 30,
                right: 30,
                child: AppButton(
                  onPressed: () => _openAddSheet(context),
                  label: l10n.addSubscription,
                ),
              ),
          ],
        );
      },
    );
  }

  void _openDetailSheet(BuildContext context, Subscription subscription) {
    showAppFullBottomSheet(
      context: context,
      builder: (_) => SubscriptionDetailSheet(subscription: subscription),
    );
  }

  void _openAddSheet(BuildContext context) {
    showAppFullBottomSheet(
      context: context,
      builder: (_) => const AddSubscriptionSheet(),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.count,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: selected
                    ? theme.colorScheme.onSurface
                    : (isDark ? Palette.textMutedDark : Palette.textMutedLight),
              ),
            ),
            if (count > 0) ...[
              const SizedBox(width: 6),
              Text(
                '$count',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isDark
                      ? Palette.textSecondaryDark
                      : Palette.textSecondaryLight,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ExpiredEmptyState extends StatelessWidget {
  const _ExpiredEmptyState({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history_rounded,
            size: 48,
            color: isDark ? Palette.textMutedDark : Palette.textMutedLight,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noExpiredSubscriptions,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.noExpiredSubscriptionsDescription,
            style: theme.textTheme.bodySmall?.copyWith(
              color: isDark
                  ? Palette.textSecondaryDark
                  : Palette.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}

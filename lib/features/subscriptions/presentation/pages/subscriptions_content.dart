import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:fl_subscriber/core/widgets/button.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/pages/add_subscription_sheet.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/pages/subscription_detail_sheet.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/subscription_controller.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/empty_state.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/subscription_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubscriptionsContent extends ConsumerWidget {
  const SubscriptionsContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscriptionsAsync = ref.watch(subscriptionControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    return subscriptionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
        child: Text(l10n.somethingWentWrong(e.toString())),
      ),
      data: (subscriptions) => Stack(
        children: [
          if (subscriptions.isEmpty)
            const SubscriptionEmptyState()
          else
            ListView.separated(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 100),
              itemCount: subscriptions.length,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final sub = subscriptions[index];
                return SubscriptionCard(
                  subscription: sub,
                  onTap: () => _openDetailSheet(context, sub),
                );
              },
            ),
          Positioned(
            bottom: 24,
            left: 30,
            right: 30,
            child: AppButton(
              onPressed: () => _openAddSheet(context),
              label: l10n.addSubscription,
              icon: Icons.add_rounded,
            ),
          ),
        ],
      ),
    );
  }

  void _openDetailSheet(BuildContext context, Subscription subscription) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => SubscriptionDetailSheet(subscription: subscription),
    );
  }

  void _openAddSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => const AddSubscriptionSheet(),
    );
  }
}

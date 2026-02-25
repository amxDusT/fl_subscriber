import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/widgets/section_label.dart';
import 'package:fl_subscriber/core/widgets/selectable_tile.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FrequencyStep extends ConsumerWidget {
  const FrequencyStep({super.key, this.onFrequencySelected});

  final VoidCallback? onFrequencySelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final wizardState = ref.watch(addSubscriptionControllerProvider);
    final controller = ref.read(addSubscriptionControllerProvider.notifier);

    final labels = {
      BillingFrequency.monthly: l10n.monthly,
      BillingFrequency.quarterly: l10n.quarterly,
      BillingFrequency.semiannual: l10n.semiannual,
      BillingFrequency.yearly: l10n.yearly,
    };

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      children: [
        SectionLabel(label: l10n.billingFrequency),
        const SizedBox(height: 10),
        ...BillingFrequency.values.map((freq) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SelectableTile(
              label: labels[freq]!,
              selected: freq == wizardState.frequency,
              onTap: () {
                controller.setFrequency(freq);
                onFrequencySelected?.call();
              },
            ),
          );
        }),
      ],
    );
  }
}

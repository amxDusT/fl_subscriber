import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlanAmountStep extends ConsumerStatefulWidget {
  const PlanAmountStep({super.key});

  @override
  ConsumerState<PlanAmountStep> createState() => _PlanAmountStepState();
}

class _PlanAmountStepState extends ConsumerState<PlanAmountStep> {
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final wizardState = ref.watch(addSubscriptionControllerProvider);
    final controller = ref.read(addSubscriptionControllerProvider.notifier);

    final hasPlans = !wizardState.isCustom &&
        wizardState.selectedService != null &&
        wizardState.selectedService!.plans.isNotEmpty;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      children: [
        if (hasPlans) ...[
          _SectionLabel(label: l10n.choosePlan),
          const SizedBox(height: 10),
          ...wizardState.selectedService!.plans.map((plan) {
            final selected = wizardState.selectedPlan?.name == plan.name;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Material(
                color: selected
                    ? (isDark ? Palette.elevatedDark : Palette.elevatedLight)
                    : theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () {
                    controller.selectPlan(plan);
                    _amountController.text = plan.monthlyPrice.toStringAsFixed(2);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            plan.name,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight:
                                  selected ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          '€${plan.monthlyPrice.toStringAsFixed(2)}${l10n.perMonth}',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (selected) ...[
                          const SizedBox(width: 10),
                          Icon(
                            Icons.check_rounded,
                            size: 18,
                            color: theme.colorScheme.onSurface,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 16),
          _SectionLabel(label: l10n.orEnterCustomAmount),
          const SizedBox(height: 10),
        ] else ...[
          _SectionLabel(label: l10n.amount),
          const SizedBox(height: 10),
        ],
        TextField(
          controller: _amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
          ],
          onChanged: (value) {
            final amount = double.tryParse(value);
            if (amount != null) {
              controller.setCustomAmount(amount);
            }
          },
          style: theme.textTheme.bodyLarge,
          decoration: InputDecoration(
            prefixText: '€ ',
            prefixStyle: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            hintText: l10n.enterAmount,
            hintStyle: theme.textTheme.bodyLarge?.copyWith(
              color: isDark ? Palette.textMutedDark : Palette.textMutedLight,
            ),
            filled: true,
            fillColor: theme.colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
        const SizedBox(height: 24),
        _SectionLabel(label: l10n.billingFrequency),
        const SizedBox(height: 10),
        _FrequencySelector(
          selected: wizardState.frequency,
          onChanged: controller.setFrequency,
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            letterSpacing: 0.8,
          ),
    );
  }
}

class _FrequencySelector extends StatelessWidget {
  const _FrequencySelector({
    required this.selected,
    required this.onChanged,
  });

  final BillingFrequency selected;
  final ValueChanged<BillingFrequency> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    final labels = {
      BillingFrequency.monthly: l10n.monthly,
      BillingFrequency.quarterly: l10n.quarterly,
      BillingFrequency.semiannual: l10n.semiannual,
      BillingFrequency.yearly: l10n.yearly,
    };

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: BillingFrequency.values.map((freq) {
          final isSelected = freq == selected;
          return GestureDetector(
            onTap: () => onChanged(freq),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected
                    ? (isDark ? Palette.elevatedDark : Palette.elevatedLight)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      labels[freq]!,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_rounded,
                      size: 18,
                      color: theme.colorScheme.onSurface,
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

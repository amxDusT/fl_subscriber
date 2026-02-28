import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/widgets/app_bottom_sheet.dart';
import 'package:fl_subscriber/core/widgets/section_label.dart';
import 'package:fl_subscriber/core/widgets/selectable_tile.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/custom_amount_step.dart';
import 'package:fl_subscriber/core/utils/haptic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlanSelectionStep extends ConsumerWidget {
  const PlanSelectionStep({
    super.key,
    this.onPlanSelected,
    this.onCustomAmountConfirmed,
  });

  final VoidCallback? onPlanSelected;
  final VoidCallback? onCustomAmountConfirmed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(addSubscriptionControllerProvider);
    final plans = wizardState.selectedService?.plans ?? [];

    if (plans.isEmpty) {
      return const _InlineAmountInput();
    }

    return _PlanList(
      onPlanSelected: onPlanSelected,
      onCustomAmountConfirmed: onCustomAmountConfirmed,
    );
  }
}

class _PlanList extends ConsumerWidget {
  const _PlanList({this.onPlanSelected, this.onCustomAmountConfirmed});

  final VoidCallback? onPlanSelected;
  final VoidCallback? onCustomAmountConfirmed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final wizardState = ref.watch(addSubscriptionControllerProvider);
    final controller = ref.read(addSubscriptionControllerProvider.notifier);

    final plans = wizardState.selectedService?.plans ?? [];

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      children: [
        SectionLabel(label: l10n.choosePlan),
        const SizedBox(height: 10),
        ...plans.map((plan) {
          final selected = wizardState.selectedPlan?.name == plan.name;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SelectableTile(
              label: plan.name,
              selected: selected,
              onTap: () {
                controller.selectPlan(plan);
                onPlanSelected?.call();
              },
              trailing: Text(
                '€${plan.monthlyPrice.toStringAsFixed(2)}${l10n.perMonth}',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }),
        const SizedBox(height: 8),
        Material(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: () async {
              triggerHaptic(ref);
              final confirmed = await showAppBottomSheet<bool>(
                context: context,
                isScrollControlled: true,
                builder: (_) => const CustomAmountSheet(),
              );
              if (confirmed == true) {
                onCustomAmountConfirmed?.call();
              }
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.edit_rounded,
                    size: 18,
                    color: isDark
                        ? Palette.textSecondaryDark
                        : Palette.textSecondaryLight,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    l10n.orEnterCustomAmount,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: isDark
                          ? Palette.textSecondaryDark
                          : Palette.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InlineAmountInput extends ConsumerStatefulWidget {
  const _InlineAmountInput();

  @override
  ConsumerState<_InlineAmountInput> createState() => _InlineAmountInputState();
}

class _InlineAmountInputState extends ConsumerState<_InlineAmountInput> {
  static final _amountRegex = RegExp(r'^\d*\.?\d{0,2}');
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
    final controller = ref.read(addSubscriptionControllerProvider.notifier);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      children: [
        SectionLabel(label: l10n.enterAmount),
        const SizedBox(height: 16),
        TextField(
          controller: _amountController,
          autofocus: true,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(_amountRegex),
          ],
          onChanged: (value) {
            final amount = double.tryParse(value);
            if (amount != null) controller.setCustomAmount(amount);
          },
          textInputAction: TextInputAction.done,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            prefixText: '€ ',
            prefixStyle: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            hintText: '0.00',
            hintStyle: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isDark ? Palette.textMutedDark : Palette.textMutedLight,
            ),
            filled: true,
            fillColor: theme.colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
          ),
        ),
      ],
    );
  }
}

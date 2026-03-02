import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAmountSheet extends ConsumerStatefulWidget {
  const CustomAmountSheet({super.key});

  @override
  ConsumerState<CustomAmountSheet> createState() => _CustomAmountSheetState();
}

class _CustomAmountSheetState extends ConsumerState<CustomAmountSheet> {
  static final _amountRegex = RegExp(r'^\d*\.?\d{0,2}');
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  bool get _canConfirm {
    return ref.read(addSubscriptionControllerProvider.notifier).canProceedFromStep2;
  }

  void _confirm() {
    if (_canConfirm) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final controller = ref.read(addSubscriptionControllerProvider.notifier);

    // Rebuild when amount changes to update button state
    ref.watch(addSubscriptionControllerProvider.select((s) => s.customAmount));

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: context.appColors.elevated,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.amount,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _amountController,
              autofocus: true,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(_amountRegex),
              ],
              onChanged: (value) {
                final amount = double.tryParse(value);
                if (amount != null) controller.setCustomAmount(amount);
              },
              onSubmitted: (_) => _confirm(),
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
                  color: context.appColors.textMuted,
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
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _canConfirm ? _confirm : null,
                child: Text(l10n.continueLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

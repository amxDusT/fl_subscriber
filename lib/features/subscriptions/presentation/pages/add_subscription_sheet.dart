import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/providers/notification_provider.dart';
import 'package:fl_subscriber/core/widgets/app_toast.dart';
import 'package:fl_subscriber/core/widgets/wizard_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/subscription_controller.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/date_alerts_step.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/frequency_step.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/plan_amount_step.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/service_selection_step.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/url_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddSubscriptionSheet extends ConsumerStatefulWidget {
  const AddSubscriptionSheet({super.key});

  @override
  ConsumerState<AddSubscriptionSheet> createState() =>
      _AddSubscriptionSheetState();
}

class _AddSubscriptionSheetState extends ConsumerState<AddSubscriptionSheet> {
  final _wizardController = WizardController();
  bool _isLoading = false;

  bool get _isCustomService =>
      ref
          .read(addSubscriptionControllerProvider)
          .selectedService
          ?.id
          .startsWith('custom_') ??
      false;

  int get _totalSteps => _isCustomService ? 5 : 4;

  int get _lastPage => _isCustomService ? 4 : 3;

  @override
  void dispose() {
    _wizardController.dispose();
    super.dispose();
  }

  Future<void> _handleFinish() async {
    final controller = ref.read(addSubscriptionControllerProvider.notifier);
    if (!controller.canFinish) return;

    setState(() => _isLoading = true);

    final subscription = controller.toSubscription();
    await ref
        .read(subscriptionControllerProvider.notifier)
        .addSubscription(subscription);

    if (subscription.alertDaysBefore != null) {
      final notifService = ref.read(notificationServiceProvider);
      await notifService.requestPermission();
      await notifService.schedulePaymentReminder(
        subscriptionId: subscription.id,
        serviceName: subscription.serviceName,
        amount: subscription.amount,
        paymentDate: subscription.nextPaymentDate,
        daysBefore: subscription.alertDaysBefore!,
      );
    }

    if (mounted) {
      final l10n = AppLocalizations.of(context)!;
      AppToast.show(
        context,
        message: l10n.toastSubscriptionAdded(subscription.serviceName),
        type: AppToastType.success,
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final controller = ref.read(addSubscriptionControllerProvider.notifier);
    final wc = _wizardController;

    ref.watch(addSubscriptionControllerProvider);

    return WizardSheet(
      title: l10n.addSubscription,
      totalSteps: _totalSteps,
      controller: wc,
      pages: [
        ServiceSelectionStep(
          onServiceSelected: () => wc.autoAdvanceTo(1),
        ),
        PlanSelectionStep(
          onPlanSelected: () => wc.autoAdvanceTo(2),
          onCustomAmountConfirmed: () => wc.autoAdvanceTo(2),
        ),
        FrequencyStep(
          onFrequencySelected: () => wc.autoAdvanceTo(3),
        ),
        const DateAlertsStep(),
        const UrlStep(),
      ],
      bottomBarBuilder: (context, wc) {
        final wizardState = ref.read(addSubscriptionControllerProvider);
        final isCustom =
            wizardState.selectedService?.id.startsWith('custom_') ?? false;
        final showBack = wc.canGoBack;
        final showFinish = wc.currentPage == _lastPage;
        final showContinue =
            (wc.currentPage == 1 &&
                (wizardState.selectedService?.plans.isEmpty ?? true)) ||
            (wc.currentPage == 3 && isCustom);

        if (!showBack && !showFinish && !showContinue) return null;

        return Row(
          children: [
            if (showBack) const WizardBackButton(),
            if (showBack && (showFinish || showContinue))
              const SizedBox(width: 12),
            if (showContinue)
              Expanded(
                child: ElevatedButton(
                  onPressed: wc.currentPage == 1
                      ? (controller.canProceedFromStep2
                            ? () => wc.autoAdvanceTo(2)
                            : null)
                      : () => wc.advanceTo(4),
                  child: Text(l10n.continueLabel),
                ),
              ),
            if (showFinish)
              Expanded(
                child: ElevatedButton(
                  onPressed: controller.canFinish ? _handleFinish : null,
                  child: _isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: theme.colorScheme.onPrimary,
                          ),
                        )
                      : Text(l10n.finish),
                ),
              ),
          ],
        );
      },
    );
  }
}

import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/providers/notification_provider.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/subscription_controller.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/date_alerts_step.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/plan_amount_step.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/service_selection_step.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddSubscriptionSheet extends ConsumerStatefulWidget {
  const AddSubscriptionSheet({super.key});

  @override
  ConsumerState<AddSubscriptionSheet> createState() =>
      _AddSubscriptionSheetState();
}

class _AddSubscriptionSheetState extends ConsumerState<AddSubscriptionSheet> {
  late final PageController _pageController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    ref.read(addSubscriptionControllerProvider.notifier).goToStep(page);
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

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final wizardState = ref.watch(addSubscriptionControllerProvider);
    final controller = ref.read(addSubscriptionControllerProvider.notifier);

    final canProceed = switch (wizardState.currentStep) {
      0 => controller.canProceedFromStep1,
      1 => controller.canProceedFromStep2,
      _ => controller.canFinish,
    };

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.88,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.addSubscription,
                        style: theme.textTheme.headlineLarge,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close_rounded, size: 20),
                        style: IconButton.styleFrom(
                          backgroundColor: theme.colorScheme.surface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                StepIndicator(currentStep: wizardState.currentStep),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (i) => controller.goToStep(i),
              children: const [
                ServiceSelectionStep(),
                PlanAmountStep(),
                DateAlertsStep(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            child: Row(
              children: [
                if (wizardState.currentStep > 0)
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      onPressed: () =>
                          _goToPage(wizardState.currentStep - 1),
                      icon: const Icon(
                          Icons.arrow_back_rounded, size: 20),
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFF2A2A2A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                if (wizardState.currentStep > 0) const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: canProceed
                        ? () {
                            if (wizardState.currentStep < 2) {
                              _goToPage(wizardState.currentStep + 1);
                            } else {
                              _handleFinish();
                            }
                          }
                        : null,
                    child: _isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: theme.colorScheme.onPrimary,
                            ),
                          )
                        : Text(
                            wizardState.currentStep < 2
                                ? l10n.continueLabel
                                : l10n.finish,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

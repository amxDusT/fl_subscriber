import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/providers/notification_provider.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/subscription_controller.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/date_alerts_step.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/frequency_step.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/plan_amount_step.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/service_selection_step.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/step_indicator.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/url_step.dart';
import 'package:fl_subscriber/core/widgets/app_bottom_sheet.dart';
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
  final List<int> _pageHistory = [0];
  bool _isLoading = false;

  // Pages:
  // 0 = Service selection
  // 1 = Plan selection (catalog with plans only)
  // 2 = Billing frequency
  // 3 = Date + Alerts
  // 4 = URL (custom subscriptions only)

  int get _currentPage => _pageHistory.last;

  bool get _isCustomService =>
      ref
          .read(addSubscriptionControllerProvider)
          .selectedService
          ?.id
          .startsWith('custom_') ??
      false;

  int get _totalSteps => _isCustomService ? 5 : 4;

  int get _lastPage => _isCustomService ? 4 : 3;

  int get _indicatorStep => switch (_currentPage) {
    0 => 0,
    1 => 1,
    2 => 2,
    3 => 3,
    4 => 4,
    _ => 0,
  };

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

  void _advanceTo(int page) {
    _pageHistory.add(page);
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  void _autoAdvanceTo(int page) {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _advanceTo(page);
    });
  }

  void _goBack() {
    if (_pageHistory.length <= 1) return;
    _pageHistory.removeLast();
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  void _onServiceSelected() {
    _autoAdvanceTo(1);
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
    final controller = ref.read(addSubscriptionControllerProvider.notifier);

    final wizardState = ref.watch(addSubscriptionControllerProvider);
    final isCustom =
        wizardState.selectedService?.id.startsWith('custom_') ?? false;
    final showBack = _pageHistory.length > 1;
    final showFinish = _currentPage == _lastPage;
    final showContinue =
        (_currentPage == 1 &&
            (wizardState.selectedService?.plans.isEmpty ?? true)) ||
        (_currentPage == 3 && isCustom);
    final showBottomBar = showBack || showFinish || showContinue;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.88,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 4),
                AppBottomSheetHeader(
                  title: l10n.addSubscription,
                  padding: EdgeInsets.zero,
                  onClose: () => Navigator.pop(context),
                ),
                const SizedBox(height: 16),
                StepIndicator(
                  currentStep: _indicatorStep,
                  totalSteps: _totalSteps,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ServiceSelectionStep(
                  onServiceSelected: _onServiceSelected,
                ),
                PlanSelectionStep(
                  onPlanSelected: () => _autoAdvanceTo(2),
                  onCustomAmountConfirmed: () => _autoAdvanceTo(2),
                ),
                FrequencyStep(
                  onFrequencySelected: () => _autoAdvanceTo(3),
                ),
                const DateAlertsStep(),
                const UrlStep(),
              ],
            ),
          ),
          if (showBottomBar)
            AnimatedPadding(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.fromLTRB(
                20,
                12,
                20,
                MediaQuery.viewInsetsOf(context).bottom > 0
                    ? MediaQuery.viewInsetsOf(context).bottom + 12
                    : 24,
              ),
              child: Row(
                children: [
                  if (showBack)
                    AppBottomSheetActionButton(
                      icon: Icons.arrow_back_rounded,
                      onPressed: _goBack,
                      size: 48,
                      iconSize: 20,
                      borderRadius: 14,
                    ),
                  if (showBack && (showFinish || showContinue))
                    const SizedBox(width: 12),
                  if (showContinue)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _currentPage == 1
                            ? (controller.canProceedFromStep2
                                  ? () => _autoAdvanceTo(2)
                                  : null)
                            : () => _advanceTo(4),
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
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/add_subscription_controller.g.dart';

@riverpod
class AddSubscriptionController extends _$AddSubscriptionController {
  @override
  AddSubscriptionState build() {
    return AddSubscriptionState(startDate: DateTime.now());
  }

  void selectService(CatalogService service) {
    state = state.copyWith(
      selectedService: service,
      selectedPlan: null,
      customAmount: null,
    );
  }

  void selectPlan(ServicePlan plan) {
    state = state.copyWith(
      selectedPlan: plan,
      customAmount: plan.monthlyPrice,
    );
  }

  void setCustomAmount(double amount) {
    state = state.copyWith(customAmount: amount, selectedPlan: null);
  }

  void setFrequency(BillingFrequency freq) {
    state = state.copyWith(frequency: freq);
  }

  void setStartDate(DateTime date) {
    state = state.copyWith(startDate: date);
  }

  void setAlertDaysBefore(int? days) {
    state = state.copyWith(alertDaysBefore: days);
  }

  void goToStep(int step) {
    state = state.copyWith(currentStep: step);
  }

  bool get canProceedFromStep1 => state.selectedService != null;

  bool get canProceedFromStep2 =>
      state.customAmount != null && state.customAmount! > 0;

  bool get canFinish => state.startDate != null;

  Subscription toSubscription() {
    final service = state.selectedService!;
    final now = DateTime.now();
    final startDate = state.startDate ?? now;

    return Subscription(
      id: 0,
      serviceId: service.id,
      serviceName: service.name,
      iconCodePoint: service.category.icon.codePoint,
      iconFontFamily: 'MaterialIcons',
      colorValue: service.color.toARGB32(),
      amount: state.customAmount!,
      planName: state.selectedPlan?.name,
      logoAsset: service.logo?.path,
      logoAssetDark: service.logoDark?.path,
      category: service.category.name,
      frequency: state.frequency,
      startDate: startDate,
      nextPaymentDate: _calculateNextPayment(startDate, state.frequency),
      alertDaysBefore: state.alertDaysBefore,
    );
  }

  DateTime _calculateNextPayment(DateTime start, BillingFrequency freq) {
    final now = DateTime.now();
    var next = start;

    while (next.isBefore(now) || next.isAtSameMomentAs(now)) {
      next = DateTime(
        next.year + (next.month + freq.months - 1) ~/ 12 -
            (next.month - 1) ~/ 12,
        (next.month + freq.months - 1) % 12 + 1,
        next.day,
      );
    }

    return next;
  }
}

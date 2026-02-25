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
      isCustom: false,
      customName: null,
      customCategory: null,
      customColorValue: null,
      selectedPlan: null,
      customAmount: null,
    );
  }

  void selectCustom() {
    state = state.copyWith(
      selectedService: null,
      isCustom: true,
      selectedPlan: null,
      customAmount: null,
    );
  }

  void setCustomName(String name) {
    state = state.copyWith(customName: name);
  }

  void setCustomCategory(ServiceCategory category) {
    state = state.copyWith(customCategory: category);
  }

  void setCustomColor(int colorValue) {
    state = state.copyWith(customColorValue: colorValue);
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

  bool get canProceedFromStep1 =>
      state.selectedService != null ||
      (state.isCustom &&
          state.customName != null &&
          state.customName!.isNotEmpty &&
          state.customCategory != null);

  bool get canProceedFromStep2 =>
      state.customAmount != null && state.customAmount! > 0;

  bool get canFinish => state.startDate != null;

  Subscription toSubscription() {
    final now = DateTime.now();
    final startDate = state.startDate ?? now;

    return Subscription(
      id: 0,
      serviceId: state.isCustom
          ? 'custom_${now.millisecondsSinceEpoch}'
          : state.selectedService!.id,
      serviceName: state.isCustom
          ? state.customName!
          : state.selectedService!.name,
      iconCodePoint: state.isCustom
          ? state.customCategory!.icon.codePoint
          : state.selectedService!.category.icon.codePoint,
      iconFontFamily: 'MaterialIcons',
      colorValue: state.isCustom
          ? (state.customColorValue ?? 0xFFFFFFFF)
          : state.selectedService!.color.toARGB32(),
      amount: state.customAmount!,
      planName: state.selectedPlan?.name,
      logoAsset: state.isCustom ? null : state.selectedService!.logo.path,
      category: state.isCustom
          ? state.customCategory?.name
          : state.selectedService!.category.name,
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

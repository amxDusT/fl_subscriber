import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/add_subscription_state.freezed.dart';

@freezed
abstract class AddSubscriptionState with _$AddSubscriptionState {
  const factory AddSubscriptionState({
    @Default(0) int currentStep,
    CatalogService? selectedService,
    ServicePlan? selectedPlan,
    double? customAmount,
    @Default(BillingFrequency.monthly) BillingFrequency frequency,
    DateTime? startDate,
    int? alertDaysBefore,
    String? unsubscribeUrl,
  }) = _AddSubscriptionState;
}

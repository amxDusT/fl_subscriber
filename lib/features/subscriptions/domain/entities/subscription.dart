import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/subscription.freezed.dart';
part 'generated/subscription.g.dart';

enum BillingFrequency {
  monthly,
  quarterly,
  semiannual,
  yearly;

  String get label {
    switch (this) {
      case BillingFrequency.monthly:
        return 'Monthly';
      case BillingFrequency.quarterly:
        return 'Every 3 Months';
      case BillingFrequency.semiannual:
        return 'Every 6 Months';
      case BillingFrequency.yearly:
        return 'Yearly';
    }
  }

  int get months {
    switch (this) {
      case BillingFrequency.monthly:
        return 1;
      case BillingFrequency.quarterly:
        return 3;
      case BillingFrequency.semiannual:
        return 6;
      case BillingFrequency.yearly:
        return 12;
    }
  }
}

@freezed
abstract class Subscription with _$Subscription {
  const factory Subscription({
    required int id,
    required String serviceId,
    required String serviceName,
    required int iconCodePoint,
    @Default('MaterialIcons') String iconFontFamily,
    required int colorValue,
    required double amount,
    @Default('EUR') String currency,
    String? planName,
    String? logoAsset,
    String? category,
    required BillingFrequency frequency,
    required DateTime startDate,
    required DateTime nextPaymentDate,
    int? alertDaysBefore,
    @Default(true) bool isActive,
    DateTime? createdAt,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

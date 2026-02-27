import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/subscription.freezed.dart';
part 'generated/subscription.g.dart';

enum BillingFrequency {
  monthly,
  quarterly,
  semiannual,
  yearly;

  String localizedLabel(AppLocalizations l10n) {
    return switch (this) {
      monthly => l10n.monthly,
      quarterly => l10n.quarterly,
      semiannual => l10n.semiannual,
      yearly => l10n.yearly,
    };
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
    String? logoAssetDark,
    String? category,
    required BillingFrequency frequency,
    required DateTime startDate,
    required DateTime nextPaymentDate,
    int? alertDaysBefore,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? endDate,
    String? unsubscribeUrl,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

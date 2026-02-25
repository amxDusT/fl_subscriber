// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Subscription _$SubscriptionFromJson(Map<String, dynamic> json) =>
    _Subscription(
      id: (json['id'] as num).toInt(),
      serviceId: json['serviceId'] as String,
      serviceName: json['serviceName'] as String,
      iconCodePoint: (json['iconCodePoint'] as num).toInt(),
      iconFontFamily: json['iconFontFamily'] as String? ?? 'MaterialIcons',
      colorValue: (json['colorValue'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'EUR',
      planName: json['planName'] as String?,
      logoAsset: json['logoAsset'] as String?,
      category: json['category'] as String?,
      frequency: $enumDecode(_$BillingFrequencyEnumMap, json['frequency']),
      startDate: DateTime.parse(json['startDate'] as String),
      nextPaymentDate: DateTime.parse(json['nextPaymentDate'] as String),
      alertDaysBefore: (json['alertDaysBefore'] as num?)?.toInt(),
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SubscriptionToJson(_Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serviceId': instance.serviceId,
      'serviceName': instance.serviceName,
      'iconCodePoint': instance.iconCodePoint,
      'iconFontFamily': instance.iconFontFamily,
      'colorValue': instance.colorValue,
      'amount': instance.amount,
      'currency': instance.currency,
      'planName': instance.planName,
      'logoAsset': instance.logoAsset,
      'category': instance.category,
      'frequency': _$BillingFrequencyEnumMap[instance.frequency]!,
      'startDate': instance.startDate.toIso8601String(),
      'nextPaymentDate': instance.nextPaymentDate.toIso8601String(),
      'alertDaysBefore': instance.alertDaysBefore,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$BillingFrequencyEnumMap = {
  BillingFrequency.monthly: 'monthly',
  BillingFrequency.quarterly: 'quarterly',
  BillingFrequency.semiannual: 'semiannual',
  BillingFrequency.yearly: 'yearly',
};

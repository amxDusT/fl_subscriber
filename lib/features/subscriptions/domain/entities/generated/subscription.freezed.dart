// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Subscription {

 int get id; String get serviceId; String get serviceName; int get iconCodePoint; String get iconFontFamily; int get colorValue; double get amount; String get currency; String? get planName; String? get logoAsset; String? get logoAssetDark; String? get category; BillingFrequency get frequency; DateTime get startDate; DateTime get nextPaymentDate; int? get alertDaysBefore; bool get isActive; DateTime? get createdAt;
/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionCopyWith<Subscription> get copyWith => _$SubscriptionCopyWithImpl<Subscription>(this as Subscription, _$identity);

  /// Serializes this Subscription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subscription&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint)&&(identical(other.iconFontFamily, iconFontFamily) || other.iconFontFamily == iconFontFamily)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.logoAsset, logoAsset) || other.logoAsset == logoAsset)&&(identical(other.logoAssetDark, logoAssetDark) || other.logoAssetDark == logoAssetDark)&&(identical(other.category, category) || other.category == category)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.nextPaymentDate, nextPaymentDate) || other.nextPaymentDate == nextPaymentDate)&&(identical(other.alertDaysBefore, alertDaysBefore) || other.alertDaysBefore == alertDaysBefore)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceId,serviceName,iconCodePoint,iconFontFamily,colorValue,amount,currency,planName,logoAsset,logoAssetDark,category,frequency,startDate,nextPaymentDate,alertDaysBefore,isActive,createdAt);

@override
String toString() {
  return 'Subscription(id: $id, serviceId: $serviceId, serviceName: $serviceName, iconCodePoint: $iconCodePoint, iconFontFamily: $iconFontFamily, colorValue: $colorValue, amount: $amount, currency: $currency, planName: $planName, logoAsset: $logoAsset, logoAssetDark: $logoAssetDark, category: $category, frequency: $frequency, startDate: $startDate, nextPaymentDate: $nextPaymentDate, alertDaysBefore: $alertDaysBefore, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SubscriptionCopyWith<$Res>  {
  factory $SubscriptionCopyWith(Subscription value, $Res Function(Subscription) _then) = _$SubscriptionCopyWithImpl;
@useResult
$Res call({
 int id, String serviceId, String serviceName, int iconCodePoint, String iconFontFamily, int colorValue, double amount, String currency, String? planName, String? logoAsset, String? logoAssetDark, String? category, BillingFrequency frequency, DateTime startDate, DateTime nextPaymentDate, int? alertDaysBefore, bool isActive, DateTime? createdAt
});




}
/// @nodoc
class _$SubscriptionCopyWithImpl<$Res>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._self, this._then);

  final Subscription _self;
  final $Res Function(Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceId = null,Object? serviceName = null,Object? iconCodePoint = null,Object? iconFontFamily = null,Object? colorValue = null,Object? amount = null,Object? currency = null,Object? planName = freezed,Object? logoAsset = freezed,Object? logoAssetDark = freezed,Object? category = freezed,Object? frequency = null,Object? startDate = null,Object? nextPaymentDate = null,Object? alertDaysBefore = freezed,Object? isActive = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,iconCodePoint: null == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int,iconFontFamily: null == iconFontFamily ? _self.iconFontFamily : iconFontFamily // ignore: cast_nullable_to_non_nullable
as String,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,planName: freezed == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String?,logoAsset: freezed == logoAsset ? _self.logoAsset : logoAsset // ignore: cast_nullable_to_non_nullable
as String?,logoAssetDark: freezed == logoAssetDark ? _self.logoAssetDark : logoAssetDark // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as BillingFrequency,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,nextPaymentDate: null == nextPaymentDate ? _self.nextPaymentDate : nextPaymentDate // ignore: cast_nullable_to_non_nullable
as DateTime,alertDaysBefore: freezed == alertDaysBefore ? _self.alertDaysBefore : alertDaysBefore // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Subscription].
extension SubscriptionPatterns on Subscription {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Subscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Subscription value)  $default,){
final _that = this;
switch (_that) {
case _Subscription():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Subscription value)?  $default,){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String serviceId,  String serviceName,  int iconCodePoint,  String iconFontFamily,  int colorValue,  double amount,  String currency,  String? planName,  String? logoAsset,  String? logoAssetDark,  String? category,  BillingFrequency frequency,  DateTime startDate,  DateTime nextPaymentDate,  int? alertDaysBefore,  bool isActive,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.id,_that.serviceId,_that.serviceName,_that.iconCodePoint,_that.iconFontFamily,_that.colorValue,_that.amount,_that.currency,_that.planName,_that.logoAsset,_that.logoAssetDark,_that.category,_that.frequency,_that.startDate,_that.nextPaymentDate,_that.alertDaysBefore,_that.isActive,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String serviceId,  String serviceName,  int iconCodePoint,  String iconFontFamily,  int colorValue,  double amount,  String currency,  String? planName,  String? logoAsset,  String? logoAssetDark,  String? category,  BillingFrequency frequency,  DateTime startDate,  DateTime nextPaymentDate,  int? alertDaysBefore,  bool isActive,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Subscription():
return $default(_that.id,_that.serviceId,_that.serviceName,_that.iconCodePoint,_that.iconFontFamily,_that.colorValue,_that.amount,_that.currency,_that.planName,_that.logoAsset,_that.logoAssetDark,_that.category,_that.frequency,_that.startDate,_that.nextPaymentDate,_that.alertDaysBefore,_that.isActive,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String serviceId,  String serviceName,  int iconCodePoint,  String iconFontFamily,  int colorValue,  double amount,  String currency,  String? planName,  String? logoAsset,  String? logoAssetDark,  String? category,  BillingFrequency frequency,  DateTime startDate,  DateTime nextPaymentDate,  int? alertDaysBefore,  bool isActive,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.id,_that.serviceId,_that.serviceName,_that.iconCodePoint,_that.iconFontFamily,_that.colorValue,_that.amount,_that.currency,_that.planName,_that.logoAsset,_that.logoAssetDark,_that.category,_that.frequency,_that.startDate,_that.nextPaymentDate,_that.alertDaysBefore,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Subscription implements Subscription {
  const _Subscription({required this.id, required this.serviceId, required this.serviceName, required this.iconCodePoint, this.iconFontFamily = 'MaterialIcons', required this.colorValue, required this.amount, this.currency = 'EUR', this.planName, this.logoAsset, this.logoAssetDark, this.category, required this.frequency, required this.startDate, required this.nextPaymentDate, this.alertDaysBefore, this.isActive = true, this.createdAt});
  factory _Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);

@override final  int id;
@override final  String serviceId;
@override final  String serviceName;
@override final  int iconCodePoint;
@override@JsonKey() final  String iconFontFamily;
@override final  int colorValue;
@override final  double amount;
@override@JsonKey() final  String currency;
@override final  String? planName;
@override final  String? logoAsset;
@override final  String? logoAssetDark;
@override final  String? category;
@override final  BillingFrequency frequency;
@override final  DateTime startDate;
@override final  DateTime nextPaymentDate;
@override final  int? alertDaysBefore;
@override@JsonKey() final  bool isActive;
@override final  DateTime? createdAt;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionCopyWith<_Subscription> get copyWith => __$SubscriptionCopyWithImpl<_Subscription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscription&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint)&&(identical(other.iconFontFamily, iconFontFamily) || other.iconFontFamily == iconFontFamily)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.logoAsset, logoAsset) || other.logoAsset == logoAsset)&&(identical(other.logoAssetDark, logoAssetDark) || other.logoAssetDark == logoAssetDark)&&(identical(other.category, category) || other.category == category)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.nextPaymentDate, nextPaymentDate) || other.nextPaymentDate == nextPaymentDate)&&(identical(other.alertDaysBefore, alertDaysBefore) || other.alertDaysBefore == alertDaysBefore)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceId,serviceName,iconCodePoint,iconFontFamily,colorValue,amount,currency,planName,logoAsset,logoAssetDark,category,frequency,startDate,nextPaymentDate,alertDaysBefore,isActive,createdAt);

@override
String toString() {
  return 'Subscription(id: $id, serviceId: $serviceId, serviceName: $serviceName, iconCodePoint: $iconCodePoint, iconFontFamily: $iconFontFamily, colorValue: $colorValue, amount: $amount, currency: $currency, planName: $planName, logoAsset: $logoAsset, logoAssetDark: $logoAssetDark, category: $category, frequency: $frequency, startDate: $startDate, nextPaymentDate: $nextPaymentDate, alertDaysBefore: $alertDaysBefore, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionCopyWith<$Res> implements $SubscriptionCopyWith<$Res> {
  factory _$SubscriptionCopyWith(_Subscription value, $Res Function(_Subscription) _then) = __$SubscriptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String serviceId, String serviceName, int iconCodePoint, String iconFontFamily, int colorValue, double amount, String currency, String? planName, String? logoAsset, String? logoAssetDark, String? category, BillingFrequency frequency, DateTime startDate, DateTime nextPaymentDate, int? alertDaysBefore, bool isActive, DateTime? createdAt
});




}
/// @nodoc
class __$SubscriptionCopyWithImpl<$Res>
    implements _$SubscriptionCopyWith<$Res> {
  __$SubscriptionCopyWithImpl(this._self, this._then);

  final _Subscription _self;
  final $Res Function(_Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceId = null,Object? serviceName = null,Object? iconCodePoint = null,Object? iconFontFamily = null,Object? colorValue = null,Object? amount = null,Object? currency = null,Object? planName = freezed,Object? logoAsset = freezed,Object? logoAssetDark = freezed,Object? category = freezed,Object? frequency = null,Object? startDate = null,Object? nextPaymentDate = null,Object? alertDaysBefore = freezed,Object? isActive = null,Object? createdAt = freezed,}) {
  return _then(_Subscription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,iconCodePoint: null == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int,iconFontFamily: null == iconFontFamily ? _self.iconFontFamily : iconFontFamily // ignore: cast_nullable_to_non_nullable
as String,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,planName: freezed == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String?,logoAsset: freezed == logoAsset ? _self.logoAsset : logoAsset // ignore: cast_nullable_to_non_nullable
as String?,logoAssetDark: freezed == logoAssetDark ? _self.logoAssetDark : logoAssetDark // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as BillingFrequency,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,nextPaymentDate: null == nextPaymentDate ? _self.nextPaymentDate : nextPaymentDate // ignore: cast_nullable_to_non_nullable
as DateTime,alertDaysBefore: freezed == alertDaysBefore ? _self.alertDaysBefore : alertDaysBefore // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../add_subscription_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddSubscriptionState {

 int get currentStep; CatalogService? get selectedService; ServicePlan? get selectedPlan; double? get customAmount; BillingFrequency get frequency; DateTime? get startDate; int? get alertDaysBefore;
/// Create a copy of AddSubscriptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddSubscriptionStateCopyWith<AddSubscriptionState> get copyWith => _$AddSubscriptionStateCopyWithImpl<AddSubscriptionState>(this as AddSubscriptionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddSubscriptionState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.selectedService, selectedService) || other.selectedService == selectedService)&&(identical(other.selectedPlan, selectedPlan) || other.selectedPlan == selectedPlan)&&(identical(other.customAmount, customAmount) || other.customAmount == customAmount)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.alertDaysBefore, alertDaysBefore) || other.alertDaysBefore == alertDaysBefore));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,selectedService,selectedPlan,customAmount,frequency,startDate,alertDaysBefore);

@override
String toString() {
  return 'AddSubscriptionState(currentStep: $currentStep, selectedService: $selectedService, selectedPlan: $selectedPlan, customAmount: $customAmount, frequency: $frequency, startDate: $startDate, alertDaysBefore: $alertDaysBefore)';
}


}

/// @nodoc
abstract mixin class $AddSubscriptionStateCopyWith<$Res>  {
  factory $AddSubscriptionStateCopyWith(AddSubscriptionState value, $Res Function(AddSubscriptionState) _then) = _$AddSubscriptionStateCopyWithImpl;
@useResult
$Res call({
 int currentStep, CatalogService? selectedService, ServicePlan? selectedPlan, double? customAmount, BillingFrequency frequency, DateTime? startDate, int? alertDaysBefore
});




}
/// @nodoc
class _$AddSubscriptionStateCopyWithImpl<$Res>
    implements $AddSubscriptionStateCopyWith<$Res> {
  _$AddSubscriptionStateCopyWithImpl(this._self, this._then);

  final AddSubscriptionState _self;
  final $Res Function(AddSubscriptionState) _then;

/// Create a copy of AddSubscriptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? selectedService = freezed,Object? selectedPlan = freezed,Object? customAmount = freezed,Object? frequency = null,Object? startDate = freezed,Object? alertDaysBefore = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,selectedService: freezed == selectedService ? _self.selectedService : selectedService // ignore: cast_nullable_to_non_nullable
as CatalogService?,selectedPlan: freezed == selectedPlan ? _self.selectedPlan : selectedPlan // ignore: cast_nullable_to_non_nullable
as ServicePlan?,customAmount: freezed == customAmount ? _self.customAmount : customAmount // ignore: cast_nullable_to_non_nullable
as double?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as BillingFrequency,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,alertDaysBefore: freezed == alertDaysBefore ? _self.alertDaysBefore : alertDaysBefore // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddSubscriptionState].
extension AddSubscriptionStatePatterns on AddSubscriptionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddSubscriptionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddSubscriptionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddSubscriptionState value)  $default,){
final _that = this;
switch (_that) {
case _AddSubscriptionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddSubscriptionState value)?  $default,){
final _that = this;
switch (_that) {
case _AddSubscriptionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStep,  CatalogService? selectedService,  ServicePlan? selectedPlan,  double? customAmount,  BillingFrequency frequency,  DateTime? startDate,  int? alertDaysBefore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddSubscriptionState() when $default != null:
return $default(_that.currentStep,_that.selectedService,_that.selectedPlan,_that.customAmount,_that.frequency,_that.startDate,_that.alertDaysBefore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStep,  CatalogService? selectedService,  ServicePlan? selectedPlan,  double? customAmount,  BillingFrequency frequency,  DateTime? startDate,  int? alertDaysBefore)  $default,) {final _that = this;
switch (_that) {
case _AddSubscriptionState():
return $default(_that.currentStep,_that.selectedService,_that.selectedPlan,_that.customAmount,_that.frequency,_that.startDate,_that.alertDaysBefore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStep,  CatalogService? selectedService,  ServicePlan? selectedPlan,  double? customAmount,  BillingFrequency frequency,  DateTime? startDate,  int? alertDaysBefore)?  $default,) {final _that = this;
switch (_that) {
case _AddSubscriptionState() when $default != null:
return $default(_that.currentStep,_that.selectedService,_that.selectedPlan,_that.customAmount,_that.frequency,_that.startDate,_that.alertDaysBefore);case _:
  return null;

}
}

}

/// @nodoc


class _AddSubscriptionState implements AddSubscriptionState {
  const _AddSubscriptionState({this.currentStep = 0, this.selectedService, this.selectedPlan, this.customAmount, this.frequency = BillingFrequency.monthly, this.startDate, this.alertDaysBefore});
  

@override@JsonKey() final  int currentStep;
@override final  CatalogService? selectedService;
@override final  ServicePlan? selectedPlan;
@override final  double? customAmount;
@override@JsonKey() final  BillingFrequency frequency;
@override final  DateTime? startDate;
@override final  int? alertDaysBefore;

/// Create a copy of AddSubscriptionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddSubscriptionStateCopyWith<_AddSubscriptionState> get copyWith => __$AddSubscriptionStateCopyWithImpl<_AddSubscriptionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddSubscriptionState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.selectedService, selectedService) || other.selectedService == selectedService)&&(identical(other.selectedPlan, selectedPlan) || other.selectedPlan == selectedPlan)&&(identical(other.customAmount, customAmount) || other.customAmount == customAmount)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.alertDaysBefore, alertDaysBefore) || other.alertDaysBefore == alertDaysBefore));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,selectedService,selectedPlan,customAmount,frequency,startDate,alertDaysBefore);

@override
String toString() {
  return 'AddSubscriptionState(currentStep: $currentStep, selectedService: $selectedService, selectedPlan: $selectedPlan, customAmount: $customAmount, frequency: $frequency, startDate: $startDate, alertDaysBefore: $alertDaysBefore)';
}


}

/// @nodoc
abstract mixin class _$AddSubscriptionStateCopyWith<$Res> implements $AddSubscriptionStateCopyWith<$Res> {
  factory _$AddSubscriptionStateCopyWith(_AddSubscriptionState value, $Res Function(_AddSubscriptionState) _then) = __$AddSubscriptionStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStep, CatalogService? selectedService, ServicePlan? selectedPlan, double? customAmount, BillingFrequency frequency, DateTime? startDate, int? alertDaysBefore
});




}
/// @nodoc
class __$AddSubscriptionStateCopyWithImpl<$Res>
    implements _$AddSubscriptionStateCopyWith<$Res> {
  __$AddSubscriptionStateCopyWithImpl(this._self, this._then);

  final _AddSubscriptionState _self;
  final $Res Function(_AddSubscriptionState) _then;

/// Create a copy of AddSubscriptionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? selectedService = freezed,Object? selectedPlan = freezed,Object? customAmount = freezed,Object? frequency = null,Object? startDate = freezed,Object? alertDaysBefore = freezed,}) {
  return _then(_AddSubscriptionState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,selectedService: freezed == selectedService ? _self.selectedService : selectedService // ignore: cast_nullable_to_non_nullable
as CatalogService?,selectedPlan: freezed == selectedPlan ? _self.selectedPlan : selectedPlan // ignore: cast_nullable_to_non_nullable
as ServicePlan?,customAmount: freezed == customAmount ? _self.customAmount : customAmount // ignore: cast_nullable_to_non_nullable
as double?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as BillingFrequency,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,alertDaysBefore: freezed == alertDaysBefore ? _self.alertDaysBefore : alertDaysBefore // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on

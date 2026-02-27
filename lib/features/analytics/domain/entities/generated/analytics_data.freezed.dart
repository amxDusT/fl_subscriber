// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../analytics_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategorySpending {

 String get categoryKey; double get monthlyAmount; double get percentage; int get subscriptionCount;
/// Create a copy of CategorySpending
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategorySpendingCopyWith<CategorySpending> get copyWith => _$CategorySpendingCopyWithImpl<CategorySpending>(this as CategorySpending, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategorySpending&&(identical(other.categoryKey, categoryKey) || other.categoryKey == categoryKey)&&(identical(other.monthlyAmount, monthlyAmount) || other.monthlyAmount == monthlyAmount)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.subscriptionCount, subscriptionCount) || other.subscriptionCount == subscriptionCount));
}


@override
int get hashCode => Object.hash(runtimeType,categoryKey,monthlyAmount,percentage,subscriptionCount);

@override
String toString() {
  return 'CategorySpending(categoryKey: $categoryKey, monthlyAmount: $monthlyAmount, percentage: $percentage, subscriptionCount: $subscriptionCount)';
}


}

/// @nodoc
abstract mixin class $CategorySpendingCopyWith<$Res>  {
  factory $CategorySpendingCopyWith(CategorySpending value, $Res Function(CategorySpending) _then) = _$CategorySpendingCopyWithImpl;
@useResult
$Res call({
 String categoryKey, double monthlyAmount, double percentage, int subscriptionCount
});




}
/// @nodoc
class _$CategorySpendingCopyWithImpl<$Res>
    implements $CategorySpendingCopyWith<$Res> {
  _$CategorySpendingCopyWithImpl(this._self, this._then);

  final CategorySpending _self;
  final $Res Function(CategorySpending) _then;

/// Create a copy of CategorySpending
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryKey = null,Object? monthlyAmount = null,Object? percentage = null,Object? subscriptionCount = null,}) {
  return _then(_self.copyWith(
categoryKey: null == categoryKey ? _self.categoryKey : categoryKey // ignore: cast_nullable_to_non_nullable
as String,monthlyAmount: null == monthlyAmount ? _self.monthlyAmount : monthlyAmount // ignore: cast_nullable_to_non_nullable
as double,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,subscriptionCount: null == subscriptionCount ? _self.subscriptionCount : subscriptionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategorySpending].
extension CategorySpendingPatterns on CategorySpending {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategorySpending value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategorySpending() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategorySpending value)  $default,){
final _that = this;
switch (_that) {
case _CategorySpending():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategorySpending value)?  $default,){
final _that = this;
switch (_that) {
case _CategorySpending() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String categoryKey,  double monthlyAmount,  double percentage,  int subscriptionCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategorySpending() when $default != null:
return $default(_that.categoryKey,_that.monthlyAmount,_that.percentage,_that.subscriptionCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String categoryKey,  double monthlyAmount,  double percentage,  int subscriptionCount)  $default,) {final _that = this;
switch (_that) {
case _CategorySpending():
return $default(_that.categoryKey,_that.monthlyAmount,_that.percentage,_that.subscriptionCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String categoryKey,  double monthlyAmount,  double percentage,  int subscriptionCount)?  $default,) {final _that = this;
switch (_that) {
case _CategorySpending() when $default != null:
return $default(_that.categoryKey,_that.monthlyAmount,_that.percentage,_that.subscriptionCount);case _:
  return null;

}
}

}

/// @nodoc


class _CategorySpending implements CategorySpending {
  const _CategorySpending({required this.categoryKey, required this.monthlyAmount, required this.percentage, required this.subscriptionCount});
  

@override final  String categoryKey;
@override final  double monthlyAmount;
@override final  double percentage;
@override final  int subscriptionCount;

/// Create a copy of CategorySpending
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategorySpendingCopyWith<_CategorySpending> get copyWith => __$CategorySpendingCopyWithImpl<_CategorySpending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategorySpending&&(identical(other.categoryKey, categoryKey) || other.categoryKey == categoryKey)&&(identical(other.monthlyAmount, monthlyAmount) || other.monthlyAmount == monthlyAmount)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.subscriptionCount, subscriptionCount) || other.subscriptionCount == subscriptionCount));
}


@override
int get hashCode => Object.hash(runtimeType,categoryKey,monthlyAmount,percentage,subscriptionCount);

@override
String toString() {
  return 'CategorySpending(categoryKey: $categoryKey, monthlyAmount: $monthlyAmount, percentage: $percentage, subscriptionCount: $subscriptionCount)';
}


}

/// @nodoc
abstract mixin class _$CategorySpendingCopyWith<$Res> implements $CategorySpendingCopyWith<$Res> {
  factory _$CategorySpendingCopyWith(_CategorySpending value, $Res Function(_CategorySpending) _then) = __$CategorySpendingCopyWithImpl;
@override @useResult
$Res call({
 String categoryKey, double monthlyAmount, double percentage, int subscriptionCount
});




}
/// @nodoc
class __$CategorySpendingCopyWithImpl<$Res>
    implements _$CategorySpendingCopyWith<$Res> {
  __$CategorySpendingCopyWithImpl(this._self, this._then);

  final _CategorySpending _self;
  final $Res Function(_CategorySpending) _then;

/// Create a copy of CategorySpending
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryKey = null,Object? monthlyAmount = null,Object? percentage = null,Object? subscriptionCount = null,}) {
  return _then(_CategorySpending(
categoryKey: null == categoryKey ? _self.categoryKey : categoryKey // ignore: cast_nullable_to_non_nullable
as String,monthlyAmount: null == monthlyAmount ? _self.monthlyAmount : monthlyAmount // ignore: cast_nullable_to_non_nullable
as double,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,subscriptionCount: null == subscriptionCount ? _self.subscriptionCount : subscriptionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$MonthlyDataPoint {

 DateTime get month; double get totalAmount;
/// Create a copy of MonthlyDataPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyDataPointCopyWith<MonthlyDataPoint> get copyWith => _$MonthlyDataPointCopyWithImpl<MonthlyDataPoint>(this as MonthlyDataPoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyDataPoint&&(identical(other.month, month) || other.month == month)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,month,totalAmount);

@override
String toString() {
  return 'MonthlyDataPoint(month: $month, totalAmount: $totalAmount)';
}


}

/// @nodoc
abstract mixin class $MonthlyDataPointCopyWith<$Res>  {
  factory $MonthlyDataPointCopyWith(MonthlyDataPoint value, $Res Function(MonthlyDataPoint) _then) = _$MonthlyDataPointCopyWithImpl;
@useResult
$Res call({
 DateTime month, double totalAmount
});




}
/// @nodoc
class _$MonthlyDataPointCopyWithImpl<$Res>
    implements $MonthlyDataPointCopyWith<$Res> {
  _$MonthlyDataPointCopyWithImpl(this._self, this._then);

  final MonthlyDataPoint _self;
  final $Res Function(MonthlyDataPoint) _then;

/// Create a copy of MonthlyDataPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? totalAmount = null,}) {
  return _then(_self.copyWith(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MonthlyDataPoint].
extension MonthlyDataPointPatterns on MonthlyDataPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlyDataPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlyDataPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlyDataPoint value)  $default,){
final _that = this;
switch (_that) {
case _MonthlyDataPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlyDataPoint value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlyDataPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime month,  double totalAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyDataPoint() when $default != null:
return $default(_that.month,_that.totalAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime month,  double totalAmount)  $default,) {final _that = this;
switch (_that) {
case _MonthlyDataPoint():
return $default(_that.month,_that.totalAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime month,  double totalAmount)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyDataPoint() when $default != null:
return $default(_that.month,_that.totalAmount);case _:
  return null;

}
}

}

/// @nodoc


class _MonthlyDataPoint implements MonthlyDataPoint {
  const _MonthlyDataPoint({required this.month, required this.totalAmount});
  

@override final  DateTime month;
@override final  double totalAmount;

/// Create a copy of MonthlyDataPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyDataPointCopyWith<_MonthlyDataPoint> get copyWith => __$MonthlyDataPointCopyWithImpl<_MonthlyDataPoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyDataPoint&&(identical(other.month, month) || other.month == month)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,month,totalAmount);

@override
String toString() {
  return 'MonthlyDataPoint(month: $month, totalAmount: $totalAmount)';
}


}

/// @nodoc
abstract mixin class _$MonthlyDataPointCopyWith<$Res> implements $MonthlyDataPointCopyWith<$Res> {
  factory _$MonthlyDataPointCopyWith(_MonthlyDataPoint value, $Res Function(_MonthlyDataPoint) _then) = __$MonthlyDataPointCopyWithImpl;
@override @useResult
$Res call({
 DateTime month, double totalAmount
});




}
/// @nodoc
class __$MonthlyDataPointCopyWithImpl<$Res>
    implements _$MonthlyDataPointCopyWith<$Res> {
  __$MonthlyDataPointCopyWithImpl(this._self, this._then);

  final _MonthlyDataPoint _self;
  final $Res Function(_MonthlyDataPoint) _then;

/// Create a copy of MonthlyDataPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? totalAmount = null,}) {
  return _then(_MonthlyDataPoint(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$AnalyticsData {

 double get totalMonthly; double get totalYearly; int get activeCount; double get averagePerSubscription; List<CategorySpending> get categoryBreakdown; List<MonthlyDataPoint> get monthlyTrend; AnalyticsPeriod get period;
/// Create a copy of AnalyticsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsDataCopyWith<AnalyticsData> get copyWith => _$AnalyticsDataCopyWithImpl<AnalyticsData>(this as AnalyticsData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsData&&(identical(other.totalMonthly, totalMonthly) || other.totalMonthly == totalMonthly)&&(identical(other.totalYearly, totalYearly) || other.totalYearly == totalYearly)&&(identical(other.activeCount, activeCount) || other.activeCount == activeCount)&&(identical(other.averagePerSubscription, averagePerSubscription) || other.averagePerSubscription == averagePerSubscription)&&const DeepCollectionEquality().equals(other.categoryBreakdown, categoryBreakdown)&&const DeepCollectionEquality().equals(other.monthlyTrend, monthlyTrend)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,totalMonthly,totalYearly,activeCount,averagePerSubscription,const DeepCollectionEquality().hash(categoryBreakdown),const DeepCollectionEquality().hash(monthlyTrend),period);

@override
String toString() {
  return 'AnalyticsData(totalMonthly: $totalMonthly, totalYearly: $totalYearly, activeCount: $activeCount, averagePerSubscription: $averagePerSubscription, categoryBreakdown: $categoryBreakdown, monthlyTrend: $monthlyTrend, period: $period)';
}


}

/// @nodoc
abstract mixin class $AnalyticsDataCopyWith<$Res>  {
  factory $AnalyticsDataCopyWith(AnalyticsData value, $Res Function(AnalyticsData) _then) = _$AnalyticsDataCopyWithImpl;
@useResult
$Res call({
 double totalMonthly, double totalYearly, int activeCount, double averagePerSubscription, List<CategorySpending> categoryBreakdown, List<MonthlyDataPoint> monthlyTrend, AnalyticsPeriod period
});




}
/// @nodoc
class _$AnalyticsDataCopyWithImpl<$Res>
    implements $AnalyticsDataCopyWith<$Res> {
  _$AnalyticsDataCopyWithImpl(this._self, this._then);

  final AnalyticsData _self;
  final $Res Function(AnalyticsData) _then;

/// Create a copy of AnalyticsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalMonthly = null,Object? totalYearly = null,Object? activeCount = null,Object? averagePerSubscription = null,Object? categoryBreakdown = null,Object? monthlyTrend = null,Object? period = null,}) {
  return _then(_self.copyWith(
totalMonthly: null == totalMonthly ? _self.totalMonthly : totalMonthly // ignore: cast_nullable_to_non_nullable
as double,totalYearly: null == totalYearly ? _self.totalYearly : totalYearly // ignore: cast_nullable_to_non_nullable
as double,activeCount: null == activeCount ? _self.activeCount : activeCount // ignore: cast_nullable_to_non_nullable
as int,averagePerSubscription: null == averagePerSubscription ? _self.averagePerSubscription : averagePerSubscription // ignore: cast_nullable_to_non_nullable
as double,categoryBreakdown: null == categoryBreakdown ? _self.categoryBreakdown : categoryBreakdown // ignore: cast_nullable_to_non_nullable
as List<CategorySpending>,monthlyTrend: null == monthlyTrend ? _self.monthlyTrend : monthlyTrend // ignore: cast_nullable_to_non_nullable
as List<MonthlyDataPoint>,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as AnalyticsPeriod,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsData].
extension AnalyticsDataPatterns on AnalyticsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsData value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsData value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalMonthly,  double totalYearly,  int activeCount,  double averagePerSubscription,  List<CategorySpending> categoryBreakdown,  List<MonthlyDataPoint> monthlyTrend,  AnalyticsPeriod period)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
return $default(_that.totalMonthly,_that.totalYearly,_that.activeCount,_that.averagePerSubscription,_that.categoryBreakdown,_that.monthlyTrend,_that.period);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalMonthly,  double totalYearly,  int activeCount,  double averagePerSubscription,  List<CategorySpending> categoryBreakdown,  List<MonthlyDataPoint> monthlyTrend,  AnalyticsPeriod period)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsData():
return $default(_that.totalMonthly,_that.totalYearly,_that.activeCount,_that.averagePerSubscription,_that.categoryBreakdown,_that.monthlyTrend,_that.period);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalMonthly,  double totalYearly,  int activeCount,  double averagePerSubscription,  List<CategorySpending> categoryBreakdown,  List<MonthlyDataPoint> monthlyTrend,  AnalyticsPeriod period)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
return $default(_that.totalMonthly,_that.totalYearly,_that.activeCount,_that.averagePerSubscription,_that.categoryBreakdown,_that.monthlyTrend,_that.period);case _:
  return null;

}
}

}

/// @nodoc


class _AnalyticsData implements AnalyticsData {
  const _AnalyticsData({required this.totalMonthly, required this.totalYearly, required this.activeCount, required this.averagePerSubscription, required final  List<CategorySpending> categoryBreakdown, required final  List<MonthlyDataPoint> monthlyTrend, required this.period}): _categoryBreakdown = categoryBreakdown,_monthlyTrend = monthlyTrend;
  

@override final  double totalMonthly;
@override final  double totalYearly;
@override final  int activeCount;
@override final  double averagePerSubscription;
 final  List<CategorySpending> _categoryBreakdown;
@override List<CategorySpending> get categoryBreakdown {
  if (_categoryBreakdown is EqualUnmodifiableListView) return _categoryBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryBreakdown);
}

 final  List<MonthlyDataPoint> _monthlyTrend;
@override List<MonthlyDataPoint> get monthlyTrend {
  if (_monthlyTrend is EqualUnmodifiableListView) return _monthlyTrend;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_monthlyTrend);
}

@override final  AnalyticsPeriod period;

/// Create a copy of AnalyticsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsDataCopyWith<_AnalyticsData> get copyWith => __$AnalyticsDataCopyWithImpl<_AnalyticsData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsData&&(identical(other.totalMonthly, totalMonthly) || other.totalMonthly == totalMonthly)&&(identical(other.totalYearly, totalYearly) || other.totalYearly == totalYearly)&&(identical(other.activeCount, activeCount) || other.activeCount == activeCount)&&(identical(other.averagePerSubscription, averagePerSubscription) || other.averagePerSubscription == averagePerSubscription)&&const DeepCollectionEquality().equals(other._categoryBreakdown, _categoryBreakdown)&&const DeepCollectionEquality().equals(other._monthlyTrend, _monthlyTrend)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,totalMonthly,totalYearly,activeCount,averagePerSubscription,const DeepCollectionEquality().hash(_categoryBreakdown),const DeepCollectionEquality().hash(_monthlyTrend),period);

@override
String toString() {
  return 'AnalyticsData(totalMonthly: $totalMonthly, totalYearly: $totalYearly, activeCount: $activeCount, averagePerSubscription: $averagePerSubscription, categoryBreakdown: $categoryBreakdown, monthlyTrend: $monthlyTrend, period: $period)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsDataCopyWith<$Res> implements $AnalyticsDataCopyWith<$Res> {
  factory _$AnalyticsDataCopyWith(_AnalyticsData value, $Res Function(_AnalyticsData) _then) = __$AnalyticsDataCopyWithImpl;
@override @useResult
$Res call({
 double totalMonthly, double totalYearly, int activeCount, double averagePerSubscription, List<CategorySpending> categoryBreakdown, List<MonthlyDataPoint> monthlyTrend, AnalyticsPeriod period
});




}
/// @nodoc
class __$AnalyticsDataCopyWithImpl<$Res>
    implements _$AnalyticsDataCopyWith<$Res> {
  __$AnalyticsDataCopyWithImpl(this._self, this._then);

  final _AnalyticsData _self;
  final $Res Function(_AnalyticsData) _then;

/// Create a copy of AnalyticsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalMonthly = null,Object? totalYearly = null,Object? activeCount = null,Object? averagePerSubscription = null,Object? categoryBreakdown = null,Object? monthlyTrend = null,Object? period = null,}) {
  return _then(_AnalyticsData(
totalMonthly: null == totalMonthly ? _self.totalMonthly : totalMonthly // ignore: cast_nullable_to_non_nullable
as double,totalYearly: null == totalYearly ? _self.totalYearly : totalYearly // ignore: cast_nullable_to_non_nullable
as double,activeCount: null == activeCount ? _self.activeCount : activeCount // ignore: cast_nullable_to_non_nullable
as int,averagePerSubscription: null == averagePerSubscription ? _self.averagePerSubscription : averagePerSubscription // ignore: cast_nullable_to_non_nullable
as double,categoryBreakdown: null == categoryBreakdown ? _self._categoryBreakdown : categoryBreakdown // ignore: cast_nullable_to_non_nullable
as List<CategorySpending>,monthlyTrend: null == monthlyTrend ? _self._monthlyTrend : monthlyTrend // ignore: cast_nullable_to_non_nullable
as List<MonthlyDataPoint>,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as AnalyticsPeriod,
  ));
}


}

// dart format on

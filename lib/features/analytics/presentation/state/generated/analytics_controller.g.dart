// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../analytics_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AnalyticsPeriodController)
final analyticsPeriodControllerProvider = AnalyticsPeriodControllerProvider._();

final class AnalyticsPeriodControllerProvider
    extends $NotifierProvider<AnalyticsPeriodController, AnalyticsPeriod> {
  AnalyticsPeriodControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsPeriodControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsPeriodControllerHash();

  @$internal
  @override
  AnalyticsPeriodController create() => AnalyticsPeriodController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnalyticsPeriod value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnalyticsPeriod>(value),
    );
  }
}

String _$analyticsPeriodControllerHash() =>
    r'2edf4df7bf347679da493d3b0d7e4a509152bdce';

abstract class _$AnalyticsPeriodController extends $Notifier<AnalyticsPeriod> {
  AnalyticsPeriod build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AnalyticsPeriod, AnalyticsPeriod>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AnalyticsPeriod, AnalyticsPeriod>,
              AnalyticsPeriod,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(analyticsData)
final analyticsDataProvider = AnalyticsDataProvider._();

final class AnalyticsDataProvider
    extends $FunctionalProvider<AnalyticsData?, AnalyticsData?, AnalyticsData?>
    with $Provider<AnalyticsData?> {
  AnalyticsDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsDataHash();

  @$internal
  @override
  $ProviderElement<AnalyticsData?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AnalyticsData? create(Ref ref) {
    return analyticsData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnalyticsData? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnalyticsData?>(value),
    );
  }
}

String _$analyticsDataHash() => r'933899d31fa8c1626f4e72e04aac8202cc50408e';

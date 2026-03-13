// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../subscription_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subscriptionRepository)
final subscriptionRepositoryProvider = SubscriptionRepositoryProvider._();

final class SubscriptionRepositoryProvider
    extends
        $FunctionalProvider<
          SubscriptionRepo,
          SubscriptionRepo,
          SubscriptionRepo
        >
    with $Provider<SubscriptionRepo> {
  SubscriptionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subscriptionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subscriptionRepositoryHash();

  @$internal
  @override
  $ProviderElement<SubscriptionRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SubscriptionRepo create(Ref ref) {
    return subscriptionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubscriptionRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubscriptionRepo>(value),
    );
  }
}

String _$subscriptionRepositoryHash() =>
    r'529bbbf122365f366244ddbfc50f8963152723d2';

@ProviderFor(subscriptionLocalDatasource)
final subscriptionLocalDatasourceProvider =
    SubscriptionLocalDatasourceProvider._();

final class SubscriptionLocalDatasourceProvider
    extends
        $FunctionalProvider<
          SubscriptionLocalDatasource,
          SubscriptionLocalDatasource,
          SubscriptionLocalDatasource
        >
    with $Provider<SubscriptionLocalDatasource> {
  SubscriptionLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subscriptionLocalDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subscriptionLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<SubscriptionLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubscriptionLocalDatasource create(Ref ref) {
    return subscriptionLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubscriptionLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubscriptionLocalDatasource>(value),
    );
  }
}

String _$subscriptionLocalDatasourceHash() =>
    r'9abd487f57a1f7a0948e2a1c504ed79cfbb3baa6';

@ProviderFor(customServiceRepository)
final customServiceRepositoryProvider = CustomServiceRepositoryProvider._();

final class CustomServiceRepositoryProvider
    extends
        $FunctionalProvider<
          CustomServiceRepo,
          CustomServiceRepo,
          CustomServiceRepo
        >
    with $Provider<CustomServiceRepo> {
  CustomServiceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customServiceRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customServiceRepositoryHash();

  @$internal
  @override
  $ProviderElement<CustomServiceRepo> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CustomServiceRepo create(Ref ref) {
    return customServiceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomServiceRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomServiceRepo>(value),
    );
  }
}

String _$customServiceRepositoryHash() =>
    r'11ef444cc6ae0a25ca340df2ccc43d50bc2e4351';

@ProviderFor(customServiceLocalDatasource)
final customServiceLocalDatasourceProvider =
    CustomServiceLocalDatasourceProvider._();

final class CustomServiceLocalDatasourceProvider
    extends
        $FunctionalProvider<
          CustomServiceLocalDatasource,
          CustomServiceLocalDatasource,
          CustomServiceLocalDatasource
        >
    with $Provider<CustomServiceLocalDatasource> {
  CustomServiceLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customServiceLocalDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customServiceLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<CustomServiceLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CustomServiceLocalDatasource create(Ref ref) {
    return customServiceLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomServiceLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomServiceLocalDatasource>(value),
    );
  }
}

String _$customServiceLocalDatasourceHash() =>
    r'd324cb89e7cc831d729f91100aaf4c7d38364664';

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

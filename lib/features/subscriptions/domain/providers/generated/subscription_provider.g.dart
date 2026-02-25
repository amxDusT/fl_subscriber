// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(customServices)
final customServicesProvider = CustomServicesProvider._();

final class CustomServicesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CatalogService>>,
          List<CatalogService>,
          Stream<List<CatalogService>>
        >
    with
        $FutureModifier<List<CatalogService>>,
        $StreamProvider<List<CatalogService>> {
  CustomServicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customServicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customServicesHash();

  @$internal
  @override
  $StreamProviderElement<List<CatalogService>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CatalogService>> create(Ref ref) {
    return customServices(ref);
  }
}

String _$customServicesHash() => r'd2a0119da99fd03752aa119f92e409a4be9e14f7';

@ProviderFor(serviceCatalog)
final serviceCatalogProvider = ServiceCatalogProvider._();

final class ServiceCatalogProvider
    extends
        $FunctionalProvider<
          List<CatalogService>,
          List<CatalogService>,
          List<CatalogService>
        >
    with $Provider<List<CatalogService>> {
  ServiceCatalogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serviceCatalogProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serviceCatalogHash();

  @$internal
  @override
  $ProviderElement<List<CatalogService>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<CatalogService> create(Ref ref) {
    return serviceCatalog(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CatalogService> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CatalogService>>(value),
    );
  }
}

String _$serviceCatalogHash() => r'924b88031b79016dd11ff9b8cef8f935927b352d';

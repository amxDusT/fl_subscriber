// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$serviceCatalogHash() => r'77387fdbc2478a5ea0d476b849c665d5d393f51a';

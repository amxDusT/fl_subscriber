// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../add_subscription_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddSubscriptionController)
final addSubscriptionControllerProvider = AddSubscriptionControllerProvider._();

final class AddSubscriptionControllerProvider
    extends $NotifierProvider<AddSubscriptionController, AddSubscriptionState> {
  AddSubscriptionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addSubscriptionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addSubscriptionControllerHash();

  @$internal
  @override
  AddSubscriptionController create() => AddSubscriptionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddSubscriptionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddSubscriptionState>(value),
    );
  }
}

String _$addSubscriptionControllerHash() =>
    r'518fa855f0358be90a9b640c8144245e2d550a99';

abstract class _$AddSubscriptionController
    extends $Notifier<AddSubscriptionState> {
  AddSubscriptionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AddSubscriptionState, AddSubscriptionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddSubscriptionState, AddSubscriptionState>,
              AddSubscriptionState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

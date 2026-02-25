// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../subscription_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubscriptionController)
final subscriptionControllerProvider = SubscriptionControllerProvider._();

final class SubscriptionControllerProvider
    extends $AsyncNotifierProvider<SubscriptionController, List<Subscription>> {
  SubscriptionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subscriptionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subscriptionControllerHash();

  @$internal
  @override
  SubscriptionController create() => SubscriptionController();
}

String _$subscriptionControllerHash() =>
    r'd39428de7b75816d71951c424248deba076e2f4c';

abstract class _$SubscriptionController
    extends $AsyncNotifier<List<Subscription>> {
  FutureOr<List<Subscription>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Subscription>>, List<Subscription>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Subscription>>, List<Subscription>>,
              AsyncValue<List<Subscription>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

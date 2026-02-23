// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(login)
final loginProvider = LoginFamily._();

final class LoginProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  LoginProvider._({
    required LoginFamily super.from,
    required ({String email, String password}) super.argument,
  }) : super(
         retry: null,
         name: r'loginProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loginHash();

  @override
  String toString() {
    return r'loginProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as ({String email, String password});
    return login(ref, email: argument.email, password: argument.password);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loginHash() => r'4e6e058334c93934bb82cd4430fa087d903004c7';

final class LoginFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<bool>,
          ({String email, String password})
        > {
  LoginFamily._()
    : super(
        retry: null,
        name: r'loginProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoginProvider call({required String email, required String password}) =>
      LoginProvider._(argument: (email: email, password: password), from: this);

  @override
  String toString() => r'loginProvider';
}

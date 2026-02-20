import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/{{feature_name}}_provider.g.dart';

@riverpod
Future<bool> {{feature_name.camelCase()}}(Ref ref, {String? param}) {
  return Future.value(true);
}

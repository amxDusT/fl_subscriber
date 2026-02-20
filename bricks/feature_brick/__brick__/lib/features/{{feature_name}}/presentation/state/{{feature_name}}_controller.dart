import 'package:{{packageName}}/features/{{feature_name}}/domain/entities/{{feature_name}}_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:{{packageName}}/features/{{feature_name}}/domain/providers/{{feature_name}}_provider.dart';

part 'generated/{{feature_name.snakeCase()}}_controller.g.dart';

@riverpod
class {{feature_name.pascalCase()}}Controller extends _${{feature_name.pascalCase()}}Controller {
  @override
  Future<{{feature_name.pascalCase()}}Model?> build() async {
    return null; // initial state
  }

  Future<void> fetch{{feature_name.pascalCase()}}(String id) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final {{feature_name.camelCase()}} = await ref.read(
        {{feature_name.camelCase()}}Provider().future,
      );

      if (!{{feature_name.camelCase()}}) {
        throw Exception('{{feature_name.pascalCase()}}Model not found');
      }

      return {{feature_name.pascalCase()}}Model();
    });
  }
}

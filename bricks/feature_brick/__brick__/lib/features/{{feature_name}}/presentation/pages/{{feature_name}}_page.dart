import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{packageName}}/features/{{feature_name}}/presentation/state/{{feature_name}}_controller.dart';

class {{feature_name.pascalCase()}}Page extends ConsumerWidget {
  const {{feature_name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch({{feature_name.camelCase()}}ControllerProvider);
    return controller.when(
      data: (data) => Scaffold(
        appBar: AppBar(title: const Text('{{feature_name.pascalCase()}} Page')),
        body: Center(child: Text('Data: $data')),
      ),
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) =>
          Scaffold(body: Center(child: Text('Error: $error'))),
    );
  }
}

import 'package:{{packageName}}/core/providers/dio_provider.dart';
import 'package:{{packageName}}/features/{{feature_name}}/data/datasources/{{feature_name}}_datasource.dart';
import 'package:{{packageName}}/features/{{feature_name}}/data/repos/{{feature_name}}_repo_impl.dart';
import 'package:{{packageName}}/features/{{feature_name}}/domain/repos/{{feature_name}}_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/{{feature_name}}_data_provider.g.dart';

@riverpod
{{feature_name.pascalCase()}}Repo {{feature_name.camelCase()}}Repo(Ref ref) {
  return {{feature_name.pascalCase()}}RepoImpl(ref.read({{feature_name.camelCase()}}DatasourceProvider));
}

@riverpod
{{feature_name.pascalCase()}}Datasource {{feature_name.camelCase()}}Datasource(Ref ref) {
  return {{feature_name.pascalCase()}}DatasourceImpl(ref.read(dioClientProvider));
}

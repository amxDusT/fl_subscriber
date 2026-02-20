import 'package:{{packageName}}/features/{{feature_name}}/domain/repos/{{feature_name}}_repo.dart';
import 'package:{{packageName}}/features/{{feature_name}}/data/datasources/{{feature_name}}_datasource.dart';

class {{feature_name.pascalCase()}}RepoImpl implements {{feature_name.pascalCase()}}Repo {
  const {{feature_name.pascalCase()}}RepoImpl(this._dataSource);
  final {{feature_name.pascalCase()}}Datasource _dataSource;

  @override
  Future<void> someRepositoryMethod() {
    _dataSource;
    return Future.value();
  }
}

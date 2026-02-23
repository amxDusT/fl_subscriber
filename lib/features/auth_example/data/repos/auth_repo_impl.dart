import 'package:fl_subscriber/features/auth_example/data/datasources/auth_local_datasource.dart';
import 'package:fl_subscriber/features/auth_example/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl(this._dataSource);
  final AuthLocalDatasource _dataSource;

  @override
  Future<void> someRepositoryMethod() {
    _dataSource;
    return Future.value();
  }
}

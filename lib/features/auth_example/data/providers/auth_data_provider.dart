// data/providers/auth_data_providers.dart
import 'package:fl_subscriber/core/providers/dio_provider.dart';
import 'package:fl_subscriber/features/auth_example/data/datasources/auth_local_datasource.dart';
import 'package:fl_subscriber/features/auth_example/data/repos/auth_repo_impl.dart';
import 'package:fl_subscriber/features/auth_example/domain/repos/auth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/auth_data_provider.g.dart';

@riverpod
AuthRepo authRepository(Ref ref) {
  return AuthRepoImpl(ref.read(authLocalDatasourceProvider));
}

@riverpod
AuthLocalDatasource authLocalDatasource(Ref ref) {
  return AuthLocalDatasourceImpl(ref.read(dioClientProvider));
}

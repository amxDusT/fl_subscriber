import 'package:fl_subscriber/core/providers/database_provider.dart';
import 'package:fl_subscriber/features/subscriptions/data/datasources/custom_service_local_datasource.dart';
import 'package:fl_subscriber/features/subscriptions/data/datasources/subscription_local_datasource.dart';
import 'package:fl_subscriber/features/subscriptions/data/repos/custom_service_repo_impl.dart';
import 'package:fl_subscriber/features/subscriptions/data/repos/subscription_repo_impl.dart';
import 'package:fl_subscriber/features/subscriptions/domain/repos/custom_service_repo.dart';
import 'package:fl_subscriber/features/subscriptions/domain/repos/subscription_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/subscription_data_provider.g.dart';

@riverpod
SubscriptionRepo subscriptionRepository(Ref ref) {
  return SubscriptionRepoImpl(ref.read(subscriptionLocalDatasourceProvider));
}

@riverpod
SubscriptionLocalDatasource subscriptionLocalDatasource(Ref ref) {
  return SubscriptionLocalDatasourceImpl(ref.read(appDatabaseProvider));
}

@riverpod
CustomServiceRepo customServiceRepository(Ref ref) {
  return CustomServiceRepoImpl(ref.read(customServiceLocalDatasourceProvider));
}

@riverpod
CustomServiceLocalDatasource customServiceLocalDatasource(Ref ref) {
  return CustomServiceLocalDatasourceImpl(ref.read(appDatabaseProvider));
}

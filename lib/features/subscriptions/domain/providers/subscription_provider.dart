import 'package:fl_subscriber/features/subscriptions/data/providers/subscription_data_provider.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/subscription_provider.g.dart';

@riverpod
Stream<List<CatalogService>> customServices(Ref ref) {
  return ref.watch(customServiceRepositoryProvider).watchAll();
}

@riverpod
List<CatalogService> serviceCatalog(Ref ref) {
  final custom = ref.watch(customServicesProvider).value ?? [];
  return [...defaultServices, ...custom];
}

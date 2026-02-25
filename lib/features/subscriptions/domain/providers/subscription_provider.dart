import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/subscription_provider.g.dart';

@riverpod
List<CatalogService> serviceCatalog(Ref ref) {
  return defaultServices;
}

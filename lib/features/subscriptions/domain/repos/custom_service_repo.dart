import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';

abstract class CustomServiceRepo {
  Stream<List<CatalogService>> watchAll();
  Future<CatalogService> add({
    required String name,
    required ServiceCategory category,
    required int colorValue,
  });
  Future<void> delete(int id);
}

import 'package:fl_subscriber/features/subscriptions/data/datasources/custom_service_local_datasource.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:fl_subscriber/features/subscriptions/domain/repos/custom_service_repo.dart';

class CustomServiceRepoImpl implements CustomServiceRepo {
  const CustomServiceRepoImpl(this._datasource);

  final CustomServiceLocalDatasource _datasource;

  @override
  Stream<List<CatalogService>> watchAll() => _datasource.watchAll();

  @override
  Future<CatalogService> add({
    required String name,
    required ServiceCategory category,
    required int colorValue,
  }) =>
      _datasource.add(name: name, category: category, colorValue: colorValue);

  @override
  Future<void> delete(int id) => _datasource.delete(id);
}

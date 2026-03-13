import 'package:drift/drift.dart';
import 'package:fl_subscriber/core/resources/app_database.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:flutter/material.dart';

abstract class CustomServiceLocalDatasource {
  Stream<List<CatalogService>> watchAll();
  Future<CatalogService> add({
    required String name,
    required ServiceCategory category,
    required int colorValue,
  });
  Future<void> delete(int id);
}

class CustomServiceLocalDatasourceImpl implements CustomServiceLocalDatasource {
  const CustomServiceLocalDatasourceImpl(this._db);

  final AppDatabase _db;

  @override
  Stream<List<CatalogService>> watchAll() {
    return (_db.select(_db.customServicesTable)
          ..orderBy([(t) => OrderingTerm(expression: t.id)]))
        .watch()
        .map((rows) => rows.map(_toEntity).toList());
  }

  @override
  Future<CatalogService> add({
    required String name,
    required ServiceCategory category,
    required int colorValue,
  }) async {
    final id = await _db
        .into(_db.customServicesTable)
        .insert(CustomServicesTableCompanion.insert(
          name: name,
          category: category.name,
          colorValue: colorValue,
        ));

    return CatalogService(
      id: 'custom_$id',
      name: name,
      color: Color(colorValue),
      category: category,
    );
  }

  @override
  Future<void> delete(int id) async {
    await (_db.delete(_db.customServicesTable)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  CatalogService _toEntity(CustomServicesTableData row) {
    return CatalogService(
      id: 'custom_${row.id}',
      name: row.name,
      color: Color(row.colorValue),
      category: ServiceCategory.values.firstWhere(
        (c) => c.name == row.category,
        orElse: () => ServiceCategory.other,
      ),
    );
  }
}

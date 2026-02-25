import 'package:drift/drift.dart';
import 'package:fl_subscriber/core/providers/database_provider.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/subscription_provider.g.dart';

@riverpod
Stream<List<CatalogService>> customServices(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return (db.select(db.customServicesTable)
        ..orderBy([(t) => OrderingTerm(expression: t.id)]))
      .watch()
      .map((rows) => rows
          .map((row) => CatalogService(
                id: 'custom_${row.id}',
                name: row.name,
                color: Color(row.colorValue),
                category: ServiceCategory.values.firstWhere(
                  (c) => c.name == row.category,
                  orElse: () => ServiceCategory.other,
                ),
              ))
          .toList());
}

@riverpod
List<CatalogService> serviceCatalog(Ref ref) {
  final custom = ref.watch(customServicesProvider).value ?? [];
  return [...defaultServices, ...custom];
}

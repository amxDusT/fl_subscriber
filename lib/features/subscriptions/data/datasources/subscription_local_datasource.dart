import 'package:drift/drift.dart';
import 'package:fl_subscriber/core/resources/app_database.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
abstract class SubscriptionLocalDatasource {
  Future<List<Subscription>> getAll();
  Future<Subscription> getById(int id);
  Future<int> add(Subscription subscription);
  Future<void> update(Subscription subscription);
  Future<void> delete(int id);
  Stream<List<Subscription>> watchAll();
}

class SubscriptionLocalDatasourceImpl implements SubscriptionLocalDatasource {
  const SubscriptionLocalDatasourceImpl(this._db);

  final AppDatabase _db;

  @override
  Future<List<Subscription>> getAll() async {
    final rows = await (_db.select(_db.subscriptionsTable)
          ..orderBy([
            (t) => OrderingTerm(
                  expression: t.createdAt,
                  mode: OrderingMode.desc,
                ),
          ]))
        .get();
    return rows.map(_toEntity).toList();
  }

  @override
  Future<Subscription> getById(int id) async {
    final row = await (_db.select(_db.subscriptionsTable)
          ..where((t) => t.id.equals(id)))
        .getSingle();
    return _toEntity(row);
  }

  @override
  Future<int> add(Subscription subscription) {
    return _db.into(_db.subscriptionsTable).insert(
          _toCompanion(subscription),
        );
  }

  @override
  Future<void> update(Subscription subscription) async {
    await (_db.update(_db.subscriptionsTable)
          ..where((t) => t.id.equals(subscription.id)))
        .write(_toCompanion(subscription));
  }

  @override
  Future<void> delete(int id) async {
    await (_db.delete(_db.subscriptionsTable)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Stream<List<Subscription>> watchAll() {
    return (_db.select(_db.subscriptionsTable)
          ..orderBy([
            (t) => OrderingTerm(
                  expression: t.createdAt,
                  mode: OrderingMode.desc,
                ),
          ]))
        .watch()
        .map((rows) => rows.map(_toEntity).toList());
  }

  Subscription _toEntity(SubscriptionsTableData row) {
    return Subscription(
      id: row.id,
      serviceId: row.serviceId,
      serviceName: row.serviceName,
      iconCodePoint: row.iconCodePoint,
      iconFontFamily: row.iconFontFamily,
      colorValue: row.colorValue,
      amount: row.amount,
      currency: row.currency,
      planName: row.planName,
      logoAsset: row.logoAsset,
      logoAssetDark: row.logoAssetDark,
      category: row.category,
      frequency: BillingFrequency.values.firstWhere(
        (f) => f.name == row.frequency,
        orElse: () => BillingFrequency.monthly,
      ),
      startDate: row.startDate,
      nextPaymentDate: row.nextPaymentDate,
      alertDaysBefore: row.alertDaysBefore,
      isActive: row.isActive,
      createdAt: row.createdAt,
    );
  }

  SubscriptionsTableCompanion _toCompanion(Subscription sub) {
    return SubscriptionsTableCompanion(
      serviceId: Value(sub.serviceId),
      serviceName: Value(sub.serviceName),
      iconCodePoint: Value(sub.iconCodePoint),
      iconFontFamily: Value(sub.iconFontFamily),
      colorValue: Value(sub.colorValue),
      amount: Value(sub.amount),
      currency: Value(sub.currency),
      planName: Value(sub.planName),
      logoAsset: Value(sub.logoAsset),
      logoAssetDark: Value(sub.logoAssetDark),
      category: Value(sub.category),
      frequency: Value(sub.frequency.name),
      startDate: Value(sub.startDate),
      nextPaymentDate: Value(sub.nextPaymentDate),
      alertDaysBefore: Value(sub.alertDaysBefore),
      isActive: Value(sub.isActive),
    );
  }
}

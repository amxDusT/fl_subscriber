import 'package:fl_subscriber/features/subscriptions/data/datasources/subscription_local_datasource.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:fl_subscriber/features/subscriptions/domain/repos/subscription_repo.dart';

class SubscriptionRepoImpl implements SubscriptionRepo {
  const SubscriptionRepoImpl(this._datasource);

  final SubscriptionLocalDatasource _datasource;

  @override
  Future<List<Subscription>> getAll() => _datasource.getAll();

  @override
  Future<Subscription> getById(int id) => _datasource.getById(id);

  @override
  Future<int> add(Subscription subscription) => _datasource.add(subscription);

  @override
  Future<void> update(Subscription subscription) =>
      _datasource.update(subscription);

  @override
  Future<void> delete(int id) => _datasource.delete(id);

  @override
  Stream<List<Subscription>> watchAll() => _datasource.watchAll();
}

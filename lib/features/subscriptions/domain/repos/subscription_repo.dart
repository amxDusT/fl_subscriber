import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';

abstract class SubscriptionRepo {
  Future<List<Subscription>> getAll();
  Future<Subscription> getById(int id);
  Future<int> add(Subscription subscription);
  Future<void> update(Subscription subscription);
  Future<void> delete(int id);
  Stream<List<Subscription>> watchAll();
}

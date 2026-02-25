import 'package:fl_subscriber/features/subscriptions/data/providers/subscription_data_provider.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/subscription_controller.g.dart';

@riverpod
class SubscriptionController extends _$SubscriptionController {
  @override
  Future<List<Subscription>> build() async {
    return ref.read(subscriptionRepositoryProvider).getAll();
  }

  Future<void> addSubscription(Subscription subscription) async {
    final repo = ref.read(subscriptionRepositoryProvider);
    await repo.add(subscription);
    ref.invalidateSelf();
  }

  Future<void> deleteSubscription(int id) async {
    final repo = ref.read(subscriptionRepositoryProvider);
    await repo.delete(id);
    ref.invalidateSelf();
  }

  Future<void> updateSubscription(Subscription subscription) async {
    final repo = ref.read(subscriptionRepositoryProvider);
    await repo.update(subscription);
    ref.invalidateSelf();
  }
}

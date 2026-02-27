import 'package:fl_subscriber/core/providers/notification_provider.dart';
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

  Future<void> unsubscribeSubscription(Subscription subscription) async {
    final repo = ref.read(subscriptionRepositoryProvider);
    final updated = subscription.copyWith(
      isActive: false,
      endDate: DateTime.now(),
    );
    await repo.update(updated);
    await ref
        .read(notificationServiceProvider)
        .cancelSubscriptionReminders(subscription.id);
    ref.invalidateSelf();
  }

  Future<void> restoreSubscription(Subscription expired) async {
    final repo = ref.read(subscriptionRepositoryProvider);
    final now = DateTime.now();
    final newSub = Subscription(
      id: 0,
      serviceId: expired.serviceId,
      serviceName: expired.serviceName,
      iconCodePoint: expired.iconCodePoint,
      iconFontFamily: expired.iconFontFamily,
      colorValue: expired.colorValue,
      amount: expired.amount,
      currency: expired.currency,
      planName: expired.planName,
      logoAsset: expired.logoAsset,
      logoAssetDark: expired.logoAssetDark,
      category: expired.category,
      frequency: expired.frequency,
      startDate: now,
      nextPaymentDate: _calculateNextPayment(now, expired.frequency),
      unsubscribeUrl: expired.unsubscribeUrl,
    );
    await repo.add(newSub);
    ref.invalidateSelf();
  }

  DateTime _calculateNextPayment(DateTime start, BillingFrequency freq) {
    final now = DateTime.now();
    var next = start;
    while (next.isBefore(now) || next.isAtSameMomentAs(now)) {
      next = DateTime(
        next.year +
            (next.month + freq.months - 1) ~/ 12 -
            (next.month - 1) ~/ 12,
        (next.month + freq.months - 1) % 12 + 1,
        next.day,
      );
    }
    return next;
  }
}

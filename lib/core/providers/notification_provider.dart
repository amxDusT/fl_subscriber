import 'package:fl_subscriber/core/resources/notification_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/notification_provider.g.dart';

@Riverpod(keepAlive: true)
NotificationService notificationService(Ref ref) {
  return NotificationService();
}

import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(settings: settings);
    _initialized = true;
  }

  Future<bool> requestPermission() async {
    if (Platform.isAndroid) {
      final android = _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      return await android?.requestNotificationsPermission() ?? false;
    } else if (Platform.isIOS) {
      final ios = _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      return await ios?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          ) ??
          false;
    }
    return false;
  }

  Future<void> schedulePaymentReminder({
    required int subscriptionId,
    required String serviceName,
    required double amount,
    required DateTime paymentDate,
    required int daysBefore,
  }) async {
    final scheduledDate = paymentDate.subtract(Duration(days: daysBefore));
    if (scheduledDate.isBefore(DateTime.now())) return;

    final notificationId = subscriptionId * 10 + daysBefore;

    await _plugin.zonedSchedule(
      id: notificationId,
      title: 'Payment Reminder',
      body:
          '$serviceName payment of \$${amount.toStringAsFixed(2)} is due in $daysBefore day${daysBefore > 1 ? 's' : ''}',
      scheduledDate: tz.TZDateTime.from(scheduledDate, tz.local),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'payment_reminders',
          'Payment Reminders',
          channelDescription:
              'Notifications for upcoming subscription payments',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  Future<void> cancelSubscriptionReminders(int subscriptionId) async {
    for (final days in [1, 3, 7]) {
      await _plugin.cancel(id: subscriptionId * 10 + days);
    }
  }

  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }
}

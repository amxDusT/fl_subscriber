import 'package:fl_subscriber/core/providers/notification_provider.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/widgets/app_bottom_sheet.dart';
import 'package:fl_subscriber/core/widgets/section_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeveloperSheet extends ConsumerWidget {
  const DeveloperSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 4),
        const AppBottomSheetHeader(
          title: 'Developer',
          padding: EdgeInsets.zero,
        ),
        const SizedBox(height: 36),
        const SectionLabel(label: 'Notifications'),
        const SizedBox(height: 10),
        _DevTile(
          icon: Icons.notifications_active_rounded,
          title: 'Send notification now',
          onTap: () => _sendNow(context, ref),
        ),
        const SizedBox(height: 8),
        _DevTile(
          icon: Icons.schedule_rounded,
          title: 'Send in 10 minutes',
          onTap: () => _sendIn10Min(context, ref),
        ),
        const SizedBox(height: 8),
        _DevTile(
          icon: Icons.notifications_off_rounded,
          title: 'Cancel all notifications',
          onTap: () => _cancelAll(context, ref),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Future<void> _sendNow(BuildContext context, WidgetRef ref) async {
    final service = ref.read(notificationServiceProvider);
    final granted = await service.requestPermission();
    if (!granted) {
      if (context.mounted) _showSnack(context, 'Permission denied');
      return;
    }

    await service.schedulePaymentReminder(
      subscriptionId: 99999,
      serviceName: 'Test Service',
      amount: 9.99,
      paymentDate: DateTime.now().add(const Duration(seconds: 5)),
      daysBefore: 0,
    );
    if (context.mounted) _showSnack(context, 'Notification in a few seconds');
  }

  Future<void> _sendIn10Min(BuildContext context, WidgetRef ref) async {
    final service = ref.read(notificationServiceProvider);
    final granted = await service.requestPermission();
    if (!granted) {
      if (context.mounted) _showSnack(context, 'Permission denied');
      return;
    }

    await service.schedulePaymentReminder(
      subscriptionId: 99998,
      serviceName: 'Test Service',
      amount: 9.99,
      paymentDate: DateTime.now().add(const Duration(minutes: 10)),
      daysBefore: 0,
    );
    if (context.mounted) _showSnack(context, 'Scheduled in 10 minutes');
  }

  Future<void> _cancelAll(BuildContext context, WidgetRef ref) async {
    final service = ref.read(notificationServiceProvider);
    await service.cancelAll();
    if (context.mounted) _showSnack(context, 'All notifications cancelled');
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _DevTile extends StatelessWidget {
  const _DevTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, size: 22),
              const SizedBox(width: 14),
              Expanded(
                child: Text(title, style: theme.textTheme.bodyLarge),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: theme.brightness == Brightness.dark
                    ? Palette.textMutedDark
                    : Palette.textMutedLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

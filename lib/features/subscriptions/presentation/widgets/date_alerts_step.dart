import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateAlertsStep extends ConsumerWidget {
  const DateAlertsStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final wizardState = ref.watch(addSubscriptionControllerProvider);
    final controller = ref.read(addSubscriptionControllerProvider.notifier);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      children: [
        _SectionLabel(label: l10n.startDate),
        const SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: CupertinoTheme(
            data: CupertinoThemeData(
              brightness: theme.brightness,
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: wizardState.startDate ?? DateTime.now(),
              onDateTimeChanged: controller.setStartDate,
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        const SizedBox(height: 24),
        _SectionLabel(label: l10n.paymentAlerts),
        const SizedBox(height: 10),
        _AlertOption(
          label: l10n.alertOneDayBefore,
          selected: wizardState.alertDaysBefore == 1,
          onTap: () => controller.setAlertDaysBefore(
            wizardState.alertDaysBefore == 1 ? null : 1,
          ),
        ),
        const SizedBox(height: 8),
        _AlertOption(
          label: l10n.alertThreeDaysBefore,
          selected: wizardState.alertDaysBefore == 3,
          onTap: () => controller.setAlertDaysBefore(
            wizardState.alertDaysBefore == 3 ? null : 3,
          ),
        ),
        const SizedBox(height: 8),
        _AlertOption(
          label: l10n.alertSevenDaysBefore,
          selected: wizardState.alertDaysBefore == 7,
          onTap: () => controller.setAlertDaysBefore(
            wizardState.alertDaysBefore == 7 ? null : 7,
          ),
        ),
        const SizedBox(height: 8),
        _AlertOption(
          label: l10n.noAlerts,
          selected: wizardState.alertDaysBefore == null,
          onTap: () => controller.setAlertDaysBefore(null),
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            letterSpacing: 0.8,
          ),
    );
  }
}

class _AlertOption extends StatelessWidget {
  const _AlertOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Material(
      color: selected
          ? (isDark ? Palette.elevatedDark : Palette.elevatedLight)
          : theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
              if (selected)
                Icon(
                  Icons.check_rounded,
                  size: 18,
                  color: theme.colorScheme.onSurface,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

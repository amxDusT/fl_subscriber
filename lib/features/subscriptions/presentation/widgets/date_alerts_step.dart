import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tr_ui/tr_ui.dart';

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
        SectionLabel(label: l10n.startDate),
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
        SectionLabel(label: l10n.paymentAlerts),
        const SizedBox(height: 10),
        SelectableTile(
          label: l10n.alertOneDayBefore,
          selected: wizardState.alertDaysBefore == 1,
          onTap: () => controller.setAlertDaysBefore(
            wizardState.alertDaysBefore == 1 ? null : 1,
          ),
        ),
        const SizedBox(height: 8),
        SelectableTile(
          label: l10n.alertThreeDaysBefore,
          selected: wizardState.alertDaysBefore == 3,
          onTap: () => controller.setAlertDaysBefore(
            wizardState.alertDaysBefore == 3 ? null : 3,
          ),
        ),
        const SizedBox(height: 8),
        SelectableTile(
          label: l10n.alertSevenDaysBefore,
          selected: wizardState.alertDaysBefore == 7,
          onTap: () => controller.setAlertDaysBefore(
            wizardState.alertDaysBefore == 7 ? null : 7,
          ),
        ),
        const SizedBox(height: 8),
        SelectableTile(
          label: l10n.noAlerts,
          selected: wizardState.alertDaysBefore == null,
          onTap: () => controller.setAlertDaysBefore(null),
        ),
      ],
    );
  }
}

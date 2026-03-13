import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/widgets/app_bottom_sheet.dart';
import 'package:fl_subscriber/core/widgets/app_toast.dart';
import 'package:fl_subscriber/core/widgets/confirm_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_subscriber/core/widgets/section_label.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/subscription.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionDetailSheet extends ConsumerStatefulWidget {
  const SubscriptionDetailSheet({super.key, required this.subscription});

  final Subscription subscription;

  @override
  ConsumerState<SubscriptionDetailSheet> createState() =>
      _SubscriptionDetailSheetState();
}

class _SubscriptionDetailSheetState
    extends ConsumerState<SubscriptionDetailSheet>
    with WidgetsBindingObserver {
  bool _awaitingUnsubscribeConfirmation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed &&
        _awaitingUnsubscribeConfirmation) {
      _awaitingUnsubscribeConfirmation = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _showUnsubscribeConfirmationDialog();
      });
    }
  }

  Future<void> _openUnsubscribeUrl() async {
    final url = widget.subscription.unsubscribeUrl;
    if (url == null) return;

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      setState(() => _awaitingUnsubscribeConfirmation = true);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _showUnsubscribeConfirmationDialog() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showAppConfirmDialog(
      context: context,
      title: l10n.didYouUnsubscribe,
      message: l10n.didYouUnsubscribeMessage(widget.subscription.serviceName),
      ctaLabel: l10n.yes,
      cancelLabel: l10n.cancel,
    );

    if (confirmed == true && mounted) {
      await ref
          .read(subscriptionControllerProvider.notifier)
          .unsubscribeSubscription(widget.subscription);
      if (mounted) {
        AppToast.show(
          context,
          message: l10n.toastSubscriptionCancelled(widget.subscription.serviceName),
          type: AppToastType.success,
        );
        context.pop();
      }
    }
  }

  Future<void> _restoreSubscription() async {
    await ref
        .read(subscriptionControllerProvider.notifier)
        .restoreSubscription(widget.subscription);
    if (mounted) {
      final l10n = AppLocalizations.of(context)!;
      AppToast.show(
        context,
        message: l10n.toastSubscriptionRestored(widget.subscription.serviceName),
        type: AppToastType.success,
      );
      context.pop();
    }
  }

  List<DateTime> _computeRenewals() {
    final now = DateTime.now();
    final months = widget.subscription.frequency.months;
    final renewals = <DateTime>[];
    var date = widget.subscription.startDate;
    final limit = widget.subscription.endDate ?? now;

    while (!date.isAfter(limit)) {
      renewals.add(date);
      date = DateTime(date.year, date.month + months, date.day);
    }

    return renewals.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    final sub = widget.subscription;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final muted = context.appColors.textMuted;
    final secondary = theme.colorScheme.secondary;
    final color = Color(sub.colorValue);
    final icon = IconData(
      sub.iconCodePoint,
      fontFamily: sub.iconFontFamily,
    );
    final logoPath = isDark && sub.logoAssetDark != null
        ? sub.logoAssetDark!
        : sub.logoAsset;
    final hasLogo = logoPath != null && logoPath.isNotEmpty;
    final l10n = AppLocalizations.of(context)!;
    final dateFormat = DateFormat('MMM d, yyyy');
    final renewals = _computeRenewals();

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.88,
      child: Column(
        children: [
          // Close handle
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [AppBottomSheetCloseButton(iconSize: 18)],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
              child: Column(
                children: [
                  // Service icon
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: hasLogo
                          ? Colors.transparent
                          : color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: hasLogo
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              logoPath,
                              width: 64,
                              height: 64,
                              fit: BoxFit.contain,
                            ),
                          )
                        : Icon(icon, size: 32, color: color),
                  ),
                  const SizedBox(height: 16),

                  // Service name
                  Text(
                    sub.serviceName,
                    style: theme.textTheme.headlineMedium,
                  ),
                  if (sub.planName != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      sub.planName!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: secondary,
                      ),
                    ),
                  ],

                  const SizedBox(height: 32),

                  // Amount + frequency
                  Text(
                    '€${sub.amount.toStringAsFixed(2)}',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    sub.frequency.localizedLabel(l10n),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: secondary,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Detail rows
                  if (sub.isActive)
                    _DetailRow(
                      label: l10n.nextPayment,
                      value: dateFormat.format(sub.nextPaymentDate),
                      muted: muted,
                      theme: theme,
                    ),
                  _DetailRow(
                    label: l10n.startDate,
                    value: dateFormat.format(sub.startDate),
                    muted: muted,
                    theme: theme,
                  ),
                  if (!sub.isActive && sub.endDate != null)
                    _DetailRow(
                      label: l10n.endDate,
                      value: dateFormat.format(sub.endDate!),
                      muted: muted,
                      theme: theme,
                    ),
                  if (sub.isActive)
                    _DetailRow(
                      label: l10n.alert,
                      value: sub.alertDaysBefore != null
                          ? l10n.alertDaysBefore(sub.alertDaysBefore.toString())
                          : l10n.alertOff,
                      muted: muted,
                      theme: theme,
                      valueIcon: sub.alertDaysBefore != null
                          ? Icons.notifications_active_outlined
                          : null,
                    ),
                  if (sub.category != null)
                    _DetailRow(
                      label: l10n.category,
                      value:
                          ServiceCategory.values
                              .where((c) => c.name == sub.category)
                              .firstOrNull
                              ?.localizedLabel(l10n) ??
                          sub.category!,
                      muted: muted,
                      theme: theme,
                    ),

                  // Unsubscribe button (active subscriptions with URL)
                  if (sub.isActive && sub.unsubscribeUrl != null) ...[
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _openUnsubscribeUrl,
                        icon: const Icon(Icons.open_in_new_rounded, size: 16),
                        label: Text(l10n.openUnsubscribePage),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Palette.error,
                          side: BorderSide(
                            color: Palette.error.withValues(alpha: 0.3),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],

                  // Restore button (expired subscriptions)
                  if (!sub.isActive) ...[
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _restoreSubscription,
                        icon: const Icon(Icons.replay_rounded, size: 18),
                        label: Text(l10n.restoreSubscription),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 32),

                  // Renewals section
                  if (renewals.isNotEmpty) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SectionLabel(
                        label: l10n.renewals,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...renewals.map(
                      (date) => _RenewalRow(
                        date: date,
                        amount: sub.amount,
                        dateFormat: dateFormat,
                        muted: muted,
                        theme: theme,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    required this.muted,
    required this.theme,
    this.valueIcon,
  });

  final String label;
  final String value;
  final Color muted;
  final ThemeData theme;
  final IconData? valueIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyLarge?.copyWith(color: muted),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (valueIcon != null) ...[
                Icon(valueIcon, size: 14, color: theme.colorScheme.onSurface),
                const SizedBox(width: 6),
              ],
              Text(
                value,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RenewalRow extends StatelessWidget {
  const _RenewalRow({
    required this.date,
    required this.amount,
    required this.dateFormat,
    required this.muted,
    required this.theme,
  });

  final DateTime date;
  final double amount;
  final DateFormat dateFormat;
  final Color muted;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateFormat.format(date),
            style: theme.textTheme.bodyLarge?.copyWith(color: muted),
          ),
          Text(
            '€${amount.toStringAsFixed(2)}',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

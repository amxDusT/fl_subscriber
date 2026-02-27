import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/widgets/section_label.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UrlStep extends ConsumerStatefulWidget {
  const UrlStep({super.key});

  @override
  ConsumerState<UrlStep> createState() => _UrlStepState();
}

class _UrlStepState extends ConsumerState<UrlStep> {
  final _urlController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final controller = ref.read(addSubscriptionControllerProvider.notifier);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      children: [
        SectionLabel(label: l10n.websiteLink),
        const SizedBox(height: 16),
        TextField(
          controller: _urlController,
          autofocus: true,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          keyboardType: TextInputType.url,
          onChanged: (value) {
            final trimmed = value.trim();
            controller.setUnsubscribeUrl(trimmed.isEmpty ? null : trimmed);
          },
          textInputAction: TextInputAction.done,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: l10n.urlHint,
            hintStyle: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: isDark ? Palette.textMutedDark : Palette.textMutedLight,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Icon(
                Icons.link_rounded,
                size: 20,
                color: isDark
                    ? Palette.textSecondaryDark
                    : Palette.textSecondaryLight,
              ),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            filled: true,
            fillColor: theme.colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/providers/database_provider.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/widgets/app_bottom_sheet.dart';
import 'package:fl_subscriber/core/widgets/section_label.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:fl_subscriber/features/subscriptions/domain/providers/subscription_provider.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/custom_service_sheet.dart';
import 'package:fl_subscriber/gen/assets.gen.dart';
import 'package:fl_subscriber/core/utils/haptic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceSelectionStep extends ConsumerWidget {
  const ServiceSelectionStep({super.key, this.onServiceSelected});

  final VoidCallback? onServiceSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final services = ref.watch(serviceCatalogProvider);
    final wizardState = ref.watch(addSubscriptionControllerProvider);
    final controller = ref.read(addSubscriptionControllerProvider.notifier);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      children: [
        SectionLabel(label: l10n.selectService),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85,
          ),
          itemCount: services.length + 1,
          itemBuilder: (context, index) {
            if (index == services.length) {
              return _ServiceTile(
                icon: Icons.add_rounded,
                name: l10n.custom,
                color: isDark
                    ? Palette.textSecondaryDark
                    : Palette.textSecondaryLight,
                selected: false,
                onTap: () async {
                  triggerHaptic(ref);
                  final service = await showAppFullBottomSheet<CatalogService>(
                    context: context,
                    builder: (_) => const CustomServiceSheet(),
                  );
                  if (service != null) {
                    controller.selectService(service);
                    onServiceSelected?.call();
                  }
                },
              );
            }
            final service = services[index];
            final isCustom = service.id.startsWith('custom_');
            return _ServiceTile(
              logo: isDark && service.logoDark != null
                  ? service.logoDark!
                  : service.logo,
              icon: service.category.icon,
              name: service.name,
              color: service.color,
              selected: wizardState.selectedService?.id == service.id,
              onTap: () {
                triggerHaptic(ref);
                controller.selectService(service);
                onServiceSelected?.call();
              },
              onLongPress: isCustom
                  ? () => _confirmDelete(context, ref, service, l10n)
                  : null,
            );
          },
        ),
      ],
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    CatalogService service,
    AppLocalizations l10n,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.deleteService),
        content: Text(l10n.deleteServiceConfirmation(service.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final dbId = int.parse(service.id.replaceFirst('custom_', ''));
      final db = ref.read(appDatabaseProvider);
      await (db.delete(
        db.customServicesTable,
      )..where((t) => t.id.equals(dbId))).go();
    }
  }
}

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({
    this.logo,
    this.icon,
    required this.name,
    required this.color,
    required this.selected,
    required this.onTap,
    this.onLongPress,
  });

  final AssetGenImage? logo;
  final IconData? icon;
  final String name;
  final Color color;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

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
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: logo != null
                      ? Colors.transparent
                      : color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: logo != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: logo!.image(
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Icon(icon, size: 20, color: color),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:fl_subscriber/features/subscriptions/domain/providers/subscription_provider.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/state/add_subscription_controller.dart';
import 'package:fl_subscriber/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceSelectionStep extends ConsumerStatefulWidget {
  const ServiceSelectionStep({super.key});

  @override
  ConsumerState<ServiceSelectionStep> createState() =>
      _ServiceSelectionStepState();
}

class _ServiceSelectionStepState extends ConsumerState<ServiceSelectionStep> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final services = ref.watch(serviceCatalogProvider);
    final wizardState = ref.watch(addSubscriptionControllerProvider);
    final controller = ref.read(addSubscriptionControllerProvider.notifier);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      children: [
        _SectionLabel(label: l10n.selectService),
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
                selected: wizardState.isCustom,
                onTap: () => controller.selectCustom(),
              );
            }
            final service = services[index];
            return _ServiceTile(
              logo: service.logo,
              name: service.name,
              color: service.color,
              selected: wizardState.selectedService?.id == service.id,
              onTap: () => controller.selectService(service),
            );
          },
        ),
        if (wizardState.isCustom) ...[
          const SizedBox(height: 20),
          _SectionLabel(label: l10n.customName),
          const SizedBox(height: 10),
          TextField(
            controller: _nameController,
            onChanged: controller.setCustomName,
            style: theme.textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: l10n.customName,
              hintStyle: theme.textTheme.bodyLarge?.copyWith(
                color: isDark
                    ? Palette.textMutedDark
                    : Palette.textMutedLight,
              ),
              filled: true,
              fillColor: theme.colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _SectionLabel(label: l10n.chooseCategory),
          const SizedBox(height: 10),
          _CategoryPicker(
            selectedCategory: wizardState.customCategory,
            onCategorySelected: controller.setCustomCategory,
          ),
          const SizedBox(height: 16),
          _SectionLabel(label: l10n.chooseColor),
          const SizedBox(height: 10),
          _ColorPicker(
            selectedColor: wizardState.customColorValue,
            onColorSelected: controller.setCustomColor,
          ),
        ],
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

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({
    this.logo,
    this.icon,
    required this.name,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final AssetGenImage? logo;
  final IconData? icon;
  final String name;
  final Color color;
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

class _CategoryPicker extends StatelessWidget {
  const _CategoryPicker({
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final ServiceCategory? selectedCategory;
  final ValueChanged<ServiceCategory> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: ServiceCategory.values.map((cat) {
        final selected = selectedCategory == cat;
        return GestureDetector(
          onTap: () => onCategorySelected(cat),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: selected
                  ? (isDark ? Palette.elevatedDark : Palette.elevatedLight)
                  : theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: selected
                  ? Border.all(
                      color: theme.colorScheme.onSurface, width: 1.5)
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(cat.icon, size: 16),
                const SizedBox(width: 6),
                Text(
                  cat.label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({
    required this.selectedColor,
    required this.onColorSelected,
  });

  final int? selectedColor;
  final ValueChanged<int> onColorSelected;

  static const _colors = [
    0xFFE50914, // red
    0xFF1DB954, // green
    0xFF00A8E1, // blue
    0xFFFF9F0A, // orange
    0xFFA259FF, // purple
    0xFFFC3C44, // pink
    0xFF0A66C2, // dark blue
    0xFF6E40C9, // violet
    0xFF34C759, // lime
    0xFFFF3B30, // bright red
    0xFF5856D6, // indigo
    0xFFAF52DE, // magenta
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _colors.map((colorVal) {
        final selected = selectedColor == colorVal;
        return GestureDetector(
          onTap: () => onColorSelected(colorVal),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Color(colorVal),
              shape: BoxShape.circle,
              border: selected
                  ? Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 2.5,
                    )
                  : null,
            ),
            child: selected
                ? const Icon(Icons.check_rounded,
                    size: 16, color: Colors.white)
                : null,
          ),
        );
      }).toList(),
    );
  }
}

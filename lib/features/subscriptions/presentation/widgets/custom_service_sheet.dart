import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/providers/database_provider.dart';
import 'package:fl_subscriber/core/resources/app_database.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/widgets/app_bottom_sheet.dart';
import 'package:fl_subscriber/core/widgets/section_label.dart';
import 'package:fl_subscriber/features/subscriptions/domain/entities/service_catalog.dart';
import 'package:fl_subscriber/features/subscriptions/presentation/widgets/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomServiceSheet extends ConsumerStatefulWidget {
  const CustomServiceSheet({super.key});

  @override
  ConsumerState<CustomServiceSheet> createState() => _CustomServiceSheetState();
}

class _CustomServiceSheetState extends ConsumerState<CustomServiceSheet> {
  final _nameController = TextEditingController();
  late final PageController _pageController;
  final List<int> _pageHistory = [0];
  ServiceCategory? _category;
  int? _colorValue;

  int get _currentPage => _pageHistory.last;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _advanceTo(int page) {
    _pageHistory.add(page);
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  void _autoAdvanceTo(int page) {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _advanceTo(page);
    });
  }

  void _goBack() {
    if (_pageHistory.length <= 1) return;
    _pageHistory.removeLast();
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  Future<void> _save() async {
    final db = ref.read(appDatabaseProvider);
    final id = await db
        .into(db.customServicesTable)
        .insert(
          CustomServicesTableCompanion.insert(
            name: _nameController.text.trim(),
            category: _category!.name,
            colorValue: _colorValue!,
          ),
        );

    if (mounted) {
      Navigator.pop(
        context,
        CatalogService(
          id: 'custom_$id',
          name: _nameController.text.trim(),
          color: Color(_colorValue!),
          category: _category!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    final showBack = _pageHistory.length > 1;
    final showContinue = _currentPage == 0;
    final showBottomBar = showBack || showContinue;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.88,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 4),
                AppBottomSheetHeader(
                  title: l10n.custom,
                  padding: EdgeInsets.zero,
                ),
                const SizedBox(height: 16),
                StepIndicator(
                  currentStep: _currentPage,
                  totalSteps: 3,
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _NamePage(
                  controller: _nameController,
                  onChanged: () => setState(() {}),
                  onSubmitted: () {
                    if (_nameController.text.trim().isNotEmpty) {
                      _advanceTo(1);
                    }
                  },
                ),
                _CategoryPage(
                  selectedCategory: _category,
                  onCategorySelected: (cat) {
                    setState(() => _category = cat);
                    _autoAdvanceTo(2);
                  },
                ),
                _ColorPage(
                  selectedColor: _colorValue,
                  onColorSelected: (c) {
                    setState(() => _colorValue = c);
                    _save();
                  },
                ),
              ],
            ),
          ),
          if (showBottomBar)
            AnimatedPadding(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              padding: EdgeInsets.fromLTRB(
                24,
                12,
                24,
                bottomInset > 0 ? bottomInset + 12 : 24,
              ),
              child: Row(
                children: [
                  if (showBack)
                    AppBottomSheetActionButton(
                      icon: Icons.arrow_back_rounded,
                      onPressed: _goBack,
                      size: 52,
                      iconSize: 22,
                      borderRadius: 16,
                    ),
                  if (showBack && showContinue) const SizedBox(width: 12),
                  if (showContinue)
                    Expanded(
                      child: SizedBox(
                        height: 52,
                        child: ElevatedButton(
                          onPressed: _nameController.text.trim().isNotEmpty
                              ? () => _advanceTo(1)
                              : null,
                          child: Text(l10n.continueLabel),
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _NamePage extends StatelessWidget {
  const _NamePage({
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final VoidCallback onChanged;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(label: l10n.customName),
          const SizedBox(height: 14),
          TextField(
            controller: controller,
            autofocus: true,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            textInputAction: TextInputAction.done,
            onChanged: (_) => onChanged(),
            onSubmitted: (_) => onSubmitted(),
            style: theme.textTheme.titleLarge,
            decoration: InputDecoration(
              hintText: l10n.customName,
              hintStyle: theme.textTheme.titleLarge?.copyWith(
                color: isDark ? Palette.textMutedDark : Palette.textMutedLight,
              ),
              filled: true,
              fillColor: theme.colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryPage extends StatelessWidget {
  const _CategoryPage({
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final ServiceCategory? selectedCategory;
  final ValueChanged<ServiceCategory> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        SectionLabel(label: l10n.chooseCategory),
        const SizedBox(height: 14),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: ServiceCategory.values.map((cat) {
            final selected = selectedCategory == cat;
            return GestureDetector(
              onTap: () => onCategorySelected(cat),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: selected
                      ? (isDark ? Palette.elevatedDark : Palette.elevatedLight)
                      : theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: selected
                      ? Border.all(
                          color: theme.colorScheme.onSurface,
                          width: 1.5,
                        )
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(cat.icon, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      cat.localizedLabel(l10n),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _ColorPage extends StatelessWidget {
  const _ColorPage({
    required this.selectedColor,
    required this.onColorSelected,
  });

  final int? selectedColor;
  final ValueChanged<int> onColorSelected;

  static const _colors = [
    0xFFE50914,
    0xFF1DB954,
    0xFF00A8E1,
    0xFFFF9F0A,
    0xFFA259FF,
    0xFFFC3C44,
    0xFF0A66C2,
    0xFF6E40C9,
    0xFF34C759,
    0xFFFF3B30,
    0xFF5856D6,
    0xFFAF52DE,
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        SectionLabel(label: l10n.chooseColor),
        const SizedBox(height: 14),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _colors.map((colorVal) {
            final selected = selectedColor == colorVal;
            return GestureDetector(
              onTap: () => onColorSelected(colorVal),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(colorVal),
                  shape: BoxShape.circle,
                  border: selected
                      ? Border.all(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 3,
                        )
                      : null,
                ),
                child: selected
                    ? const Icon(
                        Icons.check_rounded,
                        size: 22,
                        color: Colors.white,
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

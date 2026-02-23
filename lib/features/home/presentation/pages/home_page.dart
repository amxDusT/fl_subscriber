import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/features/analytics/presentation/pages/analytics_page.dart';
import 'package:fl_subscriber/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  int _currentPage = 0;

  static const _profileIndex = 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateTo(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final tabs = [l10n.subscriptions, l10n.analytics];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: List.generate(tabs.length, (i) {
                        final selected = _currentPage == i;
                        return GestureDetector(
                          onTap: () => _animateTo(i),
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: i < tabs.length - 1 ? 16 : 0,
                            ),
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 200),
                              style:
                                  (theme.textTheme.headlineLarge ??
                                          const TextStyle())
                                      .copyWith(
                                        color: selected
                                            ? theme.colorScheme.onSurface
                                            : isDark
                                            ? Palette.textMutedDark
                                            : Palette.textMutedLight,
                                        fontSize: 22,
                                      ),
                              child: Text(tabs[i]),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  _AvatarButton(
                    selected: _currentPage == _profileIndex,
                    onTap: () => _animateTo(_profileIndex),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _currentPage = i),
                children: const [
                  _SubscriptionsContent(),
                  AnalyticsContent(),
                  ProfileContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarButton extends StatelessWidget {
  const _AvatarButton({required this.selected, required this.onTap});
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final bg = selected
        ? (isDark ? Palette.textPrimaryDark : Palette.textPrimaryLight)
        : (isDark ? Palette.elevatedDark : Palette.elevatedLight);
    final fg = selected
        ? (isDark ? Palette.backgroundDark : Palette.backgroundLight)
        : (isDark ? Palette.textSecondaryDark : Palette.textSecondaryLight);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 36,
        height: 36,
        decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Icon(Icons.person_rounded, size: 18, color: fg),
      ),
    );
  }
}

class _SubscriptionsContent extends StatelessWidget {
  const _SubscriptionsContent();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Subscriptions'),
    );
  }
}

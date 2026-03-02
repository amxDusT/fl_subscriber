import 'package:fl_subscriber/core/widgets/app_bottom_sheet.dart';
import 'package:fl_subscriber/core/widgets/step_indicator.dart';
import 'package:flutter/material.dart';

class WizardController extends ChangeNotifier {
  WizardController();

  final List<int> _pageHistory = [0];
  late PageController _pageController;
  bool _disposed = false;

  int get currentPage => _pageHistory.last;
  bool get canGoBack => _pageHistory.length > 1;

  void advanceTo(int page) {
    _pageHistory.add(page);
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void autoAdvanceTo(int page) {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!_disposed) advanceTo(page);
    });
  }

  void goBack() {
    if (!canGoBack) return;
    _pageHistory.removeLast();
    _pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  static WizardController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<_WizardScope>();
    assert(scope != null, 'No WizardController found in context');
    return scope!.controller;
  }
}

class _WizardScope extends InheritedNotifier<WizardController> {
  const _WizardScope({
    required this.controller,
    required super.child,
  }) : super(notifier: controller);

  final WizardController controller;
}

class WizardSheet extends StatefulWidget {
  const WizardSheet({
    super.key,
    required this.title,
    required this.totalSteps,
    required this.pages,
    this.controller,
    this.currentStep,
    this.padding = 20,
    this.stepIndicatorGap = 24,
    this.bottomBarBuilder,
    this.onClose,
  });

  final String title;
  final int totalSteps;
  final List<Widget> pages;
  final WizardController? controller;
  final int Function(WizardController controller)? currentStep;
  final double padding;
  final double stepIndicatorGap;
  final Widget? Function(BuildContext context, WizardController controller)?
      bottomBarBuilder;
  final VoidCallback? onClose;

  @override
  State<WizardSheet> createState() => _WizardSheetState();
}

class _WizardSheetState extends State<WizardSheet> {
  late final WizardController _controller;
  late final PageController _pageController;
  late final bool _ownsController;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _controller = widget.controller ?? WizardController();
    _pageController = PageController();
    _controller._pageController = _pageController;
  }

  @override
  void dispose() {
    _pageController.dispose();
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final step = widget.currentStep?.call(_controller) ?? _controller.currentPage;

    return _WizardScope(
      controller: _controller,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.padding),
            child: Column(
              children: [
                const SizedBox(height: 4),
                AppBottomSheetHeader(
                  title: widget.title,
                  padding: EdgeInsets.zero,
                  onClose: widget.onClose ?? () => Navigator.pop(context),
                ),
                const SizedBox(height: 16),
                StepIndicator(
                  currentStep: step,
                  totalSteps: widget.totalSteps,
                ),
                SizedBox(height: widget.stepIndicatorGap),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: widget.pages,
            ),
          ),
          if (widget.bottomBarBuilder != null)
            ListenableBuilder(
              listenable: _controller,
              builder: (context, _) {
                final bar = widget.bottomBarBuilder!(context, _controller);
                if (bar == null) return const SizedBox.shrink();
                return AnimatedPadding(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.fromLTRB(
                    widget.padding,
                    12,
                    widget.padding,
                    MediaQuery.viewInsetsOf(context).bottom > 0
                        ? MediaQuery.viewInsetsOf(context).bottom + 12
                        : 24,
                  ),
                  child: bar,
                );
              },
            ),
        ],
      ),
    );
  }
}

class WizardBackButton extends StatelessWidget {
  const WizardBackButton({
    super.key,
    this.size = 48,
    this.iconSize = 20,
    this.borderRadius = 14,
  });

  final double size;
  final double iconSize;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final controller = WizardController.of(context);
    return AppBottomSheetActionButton(
      icon: Icons.arrow_back_rounded,
      onPressed: controller.goBack,
      size: size,
      iconSize: iconSize,
      borderRadius: borderRadius,
    );
  }
}

import 'package:fl_subscriber/core/routes/route_names.dart';
import 'package:fl_subscriber/core/state/splash_controller.dart';
import 'package:fl_subscriber/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _scaleAnimation = Tween<double>(begin: 0.90, end: 1.10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashControllerProvider, (previous, next) {
      if (!context.mounted) return;
      if (next.hasValue) {
        context.goNamed(RouteNames.home);
      }
    });

    final splashState = ref.watch(splashControllerProvider);
    final l10n = AppLocalizations.of(context);
    final textStyle = Theme.of(context).textTheme.headlineLarge!.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w800,
      letterSpacing: -1.0,
    );

    return Scaffold(
      body: Center(
        child: splashState.when(
          loading: () => ScaleTransition(
            scale: _scaleAnimation,
            child: Text('Subtrack', style: textStyle),
          ),
          data: (_) => ScaleTransition(
            scale: _scaleAnimation,
            child: Text('Subtrack', style: textStyle),
          ),
          error: (error, _) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n?.somethingWentWrong(error.toString()) ??
                    'Something went wrong: $error',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(splashControllerProvider),
                child: Text(l10n?.retry ?? 'Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

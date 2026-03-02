import 'package:fl_subscriber/core/utils/haptic.dart';
import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:flutter/material.dart';

Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isScrollControlled = false,
  bool useSafeArea = true,
  bool hapticOnOpen = true,
}) {
  if (hapticOnOpen) {
    triggerHaptic(context);
  }

  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    useSafeArea: useSafeArea,
    builder: builder,
  );
}

Future<T?> showAppFullBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  double heightFactor = 0.88,
  bool useSafeArea = true,
  bool hapticOnOpen = true,
}) {
  return showAppBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    useSafeArea: useSafeArea,
    hapticOnOpen: hapticOnOpen,
    builder: (ctx) => SizedBox(
      height: MediaQuery.sizeOf(ctx).height * heightFactor,
      child: builder(ctx),
    ),
  );
}

class AppBottomSheetHeader extends StatelessWidget {
  const AppBottomSheetHeader({
    super.key,
    required this.title,
    this.leading,
    this.showCloseButton = true,
    this.onClose,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  });

  final String title;
  final Widget? leading;
  final bool showCloseButton;
  final VoidCallback? onClose;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          if (showCloseButton)
            AppBottomSheetCloseButton(
              onPressed: onClose ?? () => Navigator.pop(context),
            ),
        ],
      ),
    );
  }
}

class AppBottomSheetCloseButton extends StatelessWidget {
  const AppBottomSheetCloseButton({
    super.key,
    this.onPressed,
    this.iconSize = 20,
  });

  final VoidCallback? onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 40,
      height: 40,
      child: IconButton(
        onPressed: withHaptic(context, onPressed ?? () => Navigator.pop(context)),
        icon: Icon(Icons.close_rounded, size: iconSize),
        style: IconButton.styleFrom(
          backgroundColor: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class AppBottomSheetActionButton extends StatelessWidget {
  const AppBottomSheetActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize = 20,
    this.size = 48,
    this.borderRadius = 14,
    this.backgroundColor = Palette.borderDark,
    this.foregroundColor = Palette.textPrimaryDark,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final double iconSize;
  final double size;
  final double borderRadius;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: IconButton(
        onPressed: withHaptic(context, onPressed),
        icon: Icon(icon, size: iconSize),
        style: IconButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

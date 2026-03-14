import 'package:tr_ui/src/utils/haptic.dart';
import 'package:flutter/material.dart';

Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isScrollControlled = false,
  bool useSafeArea = true,
  bool hapticOnOpen = true,
  bool? showDragHandle,
  bool enableDrag = true,
  Color? backgroundColor,
}) {
  if (hapticOnOpen) {
    triggerHaptic(context);
  }

  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    useSafeArea: useSafeArea,
    showDragHandle: showDragHandle,
    enableDrag: enableDrag,
    backgroundColor: backgroundColor,
    builder: builder,
  );
}

Future<T?> showAppFullBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  double heightFactor = 1,
  bool useSafeArea = true,
  bool hapticOnOpen = true,
}) {
  return showAppBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    useSafeArea: useSafeArea,
    hapticOnOpen: hapticOnOpen,
    showDragHandle: false,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    builder: (ctx) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: heightFactor,
      maxChildSize: heightFactor,
      minChildSize: 0.4,
      snap: true,
      snapSizes: [heightFactor],
      builder: (sheetCtx, scrollController) {
        final sheetTheme = Theme.of(sheetCtx).bottomSheetTheme;
        return Material(
          color: sheetTheme.backgroundColor,
          shape: sheetTheme.shape,
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              _DragHandle(color: sheetTheme.dragHandleColor),
              Expanded(
                child: PrimaryScrollController(
                  controller: scrollController,
                  child: builder(sheetCtx),
                ),
              ),
            ],
          ),
        );
      },
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
        onPressed: withHaptic(
          context,
          onPressed ?? () => Navigator.pop(context),
        ),
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

class _DragHandle extends StatelessWidget {
  const _DragHandle({this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Container(
          width: 36,
          height: 4,
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
            borderRadius: BorderRadius.circular(2),
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
    this.backgroundColor,
    this.foregroundColor,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final double iconSize;
  final double size;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: size,
      height: size,
      child: IconButton(
        onPressed: withHaptic(context, onPressed),
        icon: Icon(icon, size: iconSize),
        style: IconButton.styleFrom(
          backgroundColor: backgroundColor ?? theme.colorScheme.outline,
          foregroundColor: foregroundColor ?? theme.colorScheme.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

import 'package:fl_subscriber/core/utils/haptic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppButton extends ConsumerWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon = Icons.arrow_forward_ios_rounded,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final child = isLoading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          )
        : icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Text(label)),
              const SizedBox(width: 8),
              Icon(icon, size: 18),
            ],
          )
        : Text(label);

    return ElevatedButton(
      onPressed: isLoading || onPressed == null
          ? null
          : () {
              triggerHaptic(ref);
              onPressed!();
            },
      child: child,
    );
  }
}

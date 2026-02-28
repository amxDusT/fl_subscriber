import 'package:fl_subscriber/core/state/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

bool isHapticEnabled(WidgetRef ref) {
  return ref.read(appControllerProvider).hapticFeedback;
}

bool isHapticEnabledFromContext(BuildContext context) {
  final container = ProviderScope.containerOf(context, listen: false);
  return container.read(appControllerProvider).hapticFeedback;
}

void triggerHaptic(WidgetRef ref) {
  if (isHapticEnabled(ref)) {
    HapticFeedback.lightImpact();
  }
}

void triggerHapticFromContext(BuildContext context) {
  if (isHapticEnabledFromContext(context)) {
    HapticFeedback.lightImpact();
  }
}

VoidCallback? withHaptic(WidgetRef ref, VoidCallback? action) {
  if (action == null) return null;
  return () {
    triggerHaptic(ref);
    action();
  };
}

VoidCallback? withHapticContext(BuildContext context, VoidCallback? action) {
  if (action == null) return null;
  return () {
    triggerHapticFromContext(context);
    action();
  };
}

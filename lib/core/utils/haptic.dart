import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HapticScope extends InheritedWidget {
  const HapticScope({
    super.key,
    required this.enabled,
    required super.child,
  });

  final bool enabled;

  @override
  bool updateShouldNotify(HapticScope oldWidget) =>
      enabled != oldWidget.enabled;

  static bool isEnabled(BuildContext context) {
    return context
            .getInheritedWidgetOfExactType<HapticScope>()
            ?.enabled ??
        true;
  }
}

void triggerHaptic(BuildContext context) {
  if (HapticScope.isEnabled(context)) {
    HapticFeedback.lightImpact();
  }
}

VoidCallback? withHaptic(BuildContext context, VoidCallback? action) {
  if (action == null) return null;
  return () {
    triggerHaptic(context);
    action();
  };
}

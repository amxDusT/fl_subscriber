import 'package:fl_subscriber/core/state/app_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void triggerHaptic(WidgetRef ref) {
  if (ref.read(appControllerProvider).hapticFeedback) {
    HapticFeedback.lightImpact();
  }
}

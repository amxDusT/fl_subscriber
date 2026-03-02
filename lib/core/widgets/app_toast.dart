import 'dart:async';

import 'package:fl_subscriber/core/theme/palette.dart';
import 'package:fl_subscriber/core/utils/haptic.dart';
import 'package:flutter/material.dart';


enum AppToastType { success, error }

/// Wrap your app with [AppToastLayer] in MaterialApp.builder,
/// then call [AppToast.show] from anywhere.
class AppToast {
  AppToast._();

  static final GlobalKey<_AppToastLayerState> _layerKey =
      GlobalKey<_AppToastLayerState>();

  static final List<_ToastEntry> _queue = [];
  static _ToastEntry? _current;
  static VoidCallback? _dismissCurrent;

  static void show(
    BuildContext context, {
    required String message,
    required AppToastType type,
  }) {
    _queue.add(_ToastEntry(message: message, type: type));

    if (_current == null) {
      _showNext();
    }
  }

  static void removeCurrent() {
    _dismissCurrent?.call();
  }

  static void removeAll() {
    _queue.clear();
    removeCurrent();
  }

  static void _showNext() {
    final layer = _layerKey.currentState;
    if (_queue.isEmpty || layer == null || !layer.mounted) return;

    final entry = _queue.removeAt(0);
    _current = entry;
    layer._show(entry);
  }

  static void _onRegisterDismiss(VoidCallback dismiss) {
    _dismissCurrent = dismiss;
  }

  static void _onDismissComplete() {
    _current = null;
    _dismissCurrent = null;
    _layerKey.currentState?._hide();

    if (_queue.isNotEmpty) {
      _showNext();
    }
  }
}

/// Place this in [MaterialApp.builder] to enable toasts above all routes.
class AppToastLayer extends StatefulWidget {
  AppToastLayer({required this.child}) : super(key: AppToast._layerKey);
  final Widget child;

  @override
  State<AppToastLayer> createState() => _AppToastLayerState();
}

class _AppToastLayerState extends State<AppToastLayer> {
  Widget? _toast;

  void _show(_ToastEntry entry) {
    setState(() {
      _toast = _ToastWidget(
        key: UniqueKey(),
        entry: entry,
        onDismissComplete: AppToast._onDismissComplete,
        onRegisterDismiss: AppToast._onRegisterDismiss,
      );
    });
  }

  void _hide() {
    setState(() => _toast = null);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        ?_toast,
      ],
    );
  }
}

class _ToastEntry {
  _ToastEntry({required this.message, required this.type});

  final String message;
  final AppToastType type;

  Color get color => switch (type) {
    AppToastType.success => const Color(0xFF90ff02),
    AppToastType.error => Palette.error,
  };

  Color get foreground => switch (type) {
    AppToastType.success => Colors.black,
    AppToastType.error => Colors.white,
  };

  IconData get icon => switch (type) {
    AppToastType.success => Icons.check_circle_rounded,
    AppToastType.error => Icons.close_rounded,
  };
}

class _ToastWidget extends StatefulWidget {
  const _ToastWidget({
    super.key,
    required this.entry,
    required this.onDismissComplete,
    required this.onRegisterDismiss,
  });

  final _ToastEntry entry;
  final VoidCallback onDismissComplete;
  final void Function(VoidCallback dismiss) onRegisterDismiss;

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _autoDismissTimer;
  bool _dismissing = false;
  double _dragOffset = 0;
  bool _dragging = false;

  double get _curvedValue => _dismissing
      ? Curves.easeInCubic.transform(_controller.value)
      : Curves.easeOutBack.transform(_controller.value);

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        )..addListener(() {
          if (mounted) setState(() {});
        });

    widget.onRegisterDismiss(_dismiss);
    _controller.forward();
    _autoDismissTimer = Timer(const Duration(seconds: 2), _dismiss);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) triggerHaptic(context);
    });
  }

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _dismiss() {
    if (_dismissing) return;
    _dismissing = true;
    _autoDismissTimer?.cancel();
    _controller.reverse().then((_) {
      widget.onDismissComplete();
    });
  }

  void _onDragStart(DragStartDetails details) {
    _dragging = true;
    _autoDismissTimer?.cancel();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (!_dragging) return;
    setState(() {
      _dragOffset = (_dragOffset + details.delta.dy).clamp(-double.infinity, 0);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    _dragging = false;
    final velocity = details.velocity.pixelsPerSecond.dy;
    final toastHeight = MediaQuery.sizeOf(context).height * 0.25;

    if (velocity < -300 || _dragOffset.abs() > toastHeight * 0.4) {
      _dismiss();
    } else {
      _snapBack();
    }
  }

  void _snapBack() {
    final from = _dragOffset;
    late final Animation<double> snapAnimation;
    snapAnimation =
        Tween<double>(begin: from, end: 0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
        )..addListener(() {
          setState(() => _dragOffset = snapAnimation.value);
        });

    _controller.value = 0;
    _controller.forward();

    _autoDismissTimer?.cancel();
    _autoDismissTimer = Timer(const Duration(seconds: 3), _dismiss);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final topPadding = MediaQuery.paddingOf(context).top;
    final visibleHeight = screenHeight * 0.25;
    final overflow = visibleHeight * 0.15;
    final toastHeight = visibleHeight + overflow;

    final animatedTop = _dragging
        ? _dragOffset + (toastHeight * (_curvedValue - 1))
        : -toastHeight + (toastHeight * _curvedValue) + _dragOffset;

    return Positioned(
      top: animatedTop - overflow,
      left: 0,
      right: 0,
      child: Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onVerticalDragStart: _onDragStart,
          onVerticalDragUpdate: _onDragUpdate,
          onVerticalDragEnd: _onDragEnd,
          child: SizedBox(
            width: double.infinity,
            height: toastHeight,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ColoredBox(
                    color: widget.entry.color,
                  ),
                ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _Notch(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    24,
                    overflow + topPadding,
                    24,
                    24,
                  ),
                  child: Align(
                    alignment: const Alignment(-1, 0.5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          widget.entry.icon,
                          color: widget.entry.foreground,
                          size: 22,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            widget.entry.message,
                            style: TextStyle(
                              color: widget.entry.foreground,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Notch extends StatelessWidget {
  const _Notch();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: Container(
          width: 48,
          height: 6,
          decoration: BoxDecoration(
            color: context.appColors.textMuted,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:theme_config/src/extensions/theme_extension.dart';

mixin LoadingOverlayMixin<T extends StatefulWidget> on State<T> {
  OverlayEntry? _overlayEntry;

  Future<void> insetOverlay(
      BuildContext context, Future Function() action) async {
    if (_overlayEntry != null) {
      return;
    }
    _overlayEntry = OverlayEntry(
      builder: (context) => Container(
        color: context.colors.primary.withValues(alpha: .1),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: .4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const CircularProgressIndicator.adaptive()),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    try {
      await action();
    } catch (e) {
      log(e.toString());
    } finally {
      removeOverlay();
    }
  }

  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    removeOverlay();
    super.didChangeDependencies();
  }
}

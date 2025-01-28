import 'package:flutter/material.dart';
import 'package:theme_config/src/extensions/theme_data_extension.dart';
import 'package:theme_config/src/extensions/theme_extension.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final String? label;
  final ButtonStyle? style;
  const PrimaryButton(
      {super.key, this.onPressed, this.child, this.label, this.style})
      : assert(label != null || child != null);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style ?? context.theme.buttonOutline,
      onPressed: onPressed,
      child: child ?? Text((label ?? "").toUpperCase()),
    );
  }
}

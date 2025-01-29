import 'package:flutter/material.dart';
import 'package:theme_config/src/extensions/theme_extension.dart';
import 'package:theme_config/theme_config.dart';

class CustomTextButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final TextStyle? textStyle;

  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.label,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.bodyMedium
            ?.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.25,
              fontSize: 14,
            )
            .merge(textStyle),
      ),
    );
  }
}

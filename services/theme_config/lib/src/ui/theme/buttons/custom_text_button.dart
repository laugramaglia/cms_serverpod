import 'package:flutter/material.dart';
import 'package:theme_config/src/extensions/theme_extension.dart';

class CustomTextButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const CustomTextButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colors.primary,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.25,
          fontSize: 14,
        ),
      ),
    );
  }
}

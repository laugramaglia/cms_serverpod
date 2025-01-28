// ThemeData extension for defining pill buttons.
import 'package:flutter/material.dart';

extension ThemeDataExtension on ThemeData {
  ButtonStyle get buttonOutline => _baseButton(backgroundColor: primaryColor);

  ButtonStyle buttonOutlineInverted(
          {Color? borderColor,
          Color bgColor = Colors.transparent,
          double? elevation}) =>
      _baseButton(
          backgroundColor: bgColor,
          elevation: elevation ?? 0,
          txtColor: borderColor ?? colorScheme.onPrimary,
          borderSide: BorderSide(
              color: borderColor ?? colorScheme.onPrimary, width: 1));

  ButtonStyle get buttonFilled => _baseButton(
      backgroundColor: primaryColor, txtColor: colorScheme.onPrimary);

  ButtonStyle _baseButton({
    required Color backgroundColor,
    Color? txtColor,
    double? elevation = 1,
    BorderSide? borderSide,
  }) =>
      ElevatedButton.styleFrom(
        iconColor: txtColor,
        foregroundColor: txtColor,
        textStyle: textTheme.bodyLarge
            ?.copyWith(fontWeight: FontWeight.bold, height: 3),
        elevation: elevation,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ).copyWith(
        textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (Set<WidgetState> states) {
            final txtStyle = textTheme.bodyMedium?.copyWith(
              color: txtColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            );
            if (states.contains(WidgetState.disabled)) {
              return txtStyle?.merge(TextStyle(
                  color: null)); // Set text color to gray when disabled
            }
            return txtStyle; // Default text color
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null; // Set background color to gray when disabled
            }
            return backgroundColor; // Default background color
          },
        ),
        side: WidgetStateProperty.resolveWith<BorderSide?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null; // Set border color to gray when disabled
            }
            return borderSide ??
                BorderSide(color: primaryColor); // Default border color
          },
        ),
      );
}

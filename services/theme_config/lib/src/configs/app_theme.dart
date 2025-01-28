import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_config/src/extensions/color_extension.dart';
import 'package:theme_config/src/extensions/theme_color_extension.dart';

class AppTheme {
  static ThemeData getTheme({
    required Brightness brightness,
    required ThemeColorExtension extension,
  }) {
    String? fontFamily = GoogleFonts.roboto().fontFamily;
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: extension.primary,
      brightness: brightness,
      surface: extension.neutral_0,
    );
    return ThemeData(
      // Define platform adaptive visual density.
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Define the default scaffold background color.
      scaffoldBackgroundColor: extension.neutral_0,

      // Define the default brightness and colors.
      brightness: brightness,

      // define the color extension
      extensions: <ThemeExtension>[extension],

      // Define the default color swatch.
      primarySwatch: extension.primary.createMaterialColor,
      colorScheme: colorScheme,
      primaryColor: extension.primary,
      primaryColorDark: extension.primary_700,
      primaryColorLight: extension.primary_50,

      // Define the default font family.
      fontFamily: fontFamily,

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
        // Headline
        headlineLarge: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),

        // body
        bodyLarge: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
        ),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: extension.primary,
        linearTrackColor: extension.neutral_100,
        circularTrackColor: extension.neutral_100,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: extension.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: extension.neutral_100,
          disabledForegroundColor: extension.neutral_300,
          textStyle: const TextStyle(fontSize: 18.0),
        ),
      ),

      // TabBar Theme
      tabBarTheme: TabBarTheme(
        labelColor: extension.primary,
        unselectedLabelStyle: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        labelStyle: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
      ),

      // Dialog Theme
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),

      // Customize AppBar
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: brightness == Brightness.light ? Colors.black : Colors.white,
        ),
        centerTitle: false,
        backgroundColor: extension.neutral_0,
        // systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      // Customize InputDecoration
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.transparent,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error, width: 1.0),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
        ),
        labelStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          height: 1.5,
        ),
        hintStyle: const TextStyle(),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.onPrimary,
        constraints: const BoxConstraints(maxWidth: 432),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
      ),
    );
  }
}

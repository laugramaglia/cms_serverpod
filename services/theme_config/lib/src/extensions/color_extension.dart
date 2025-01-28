import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Lighten a color by [percent] amount (100 = white)
  Color lighten([int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    final Color c = this;
    return Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * p).round(),
        c.green + ((255 - c.green) * p).round(),
        c.blue + ((255 - c.blue) * p).round());
  }

  /// Darken a color by [percent] amount (100 = black)
  Color darken([int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    final Color c = this;
    return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
        (c.blue * f).round());
  }

  // Define a custom [MaterialColor] with a swatch of different shades
// according to a single color.
  MaterialColor get createMaterialColor {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = red, g = green, b = blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(value, swatch);
  }

  /// Transform a [Color] to a [String] in the format `RRGGBB` in order to be used
  /// in [HtmlParser] for CSS-based styling.
  String get colorToHex {
    final val = value.toRadixString(16).substring(2, 8);
    return '#$val';
  }

  Color? computeForegroundColor({
    Color darkColor = Colors.black,
    Color lightColor = Colors.white,
  }) =>
      computeLuminance() > 0.5 ? darkColor : lightColor;
}

extension ColorStringExtension on String {
  /// Transform a [String] in the format of `#RRGGBB` into a [Color] instance. If
  /// the color can't be converted, it will return [Colors.transparent].
  static Color? stringToColor(String? color) {
    if (color == null) {
      return null;
    }
    var hexColor = color.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }

    return Colors.transparent;
  }
}

import 'package:flutter/material.dart';
import 'package:network_service/network_service.dart';
import 'package:theme_config/src/extensions/color_extension.dart';

@immutable
class ThemeColorExtension extends ThemeExtension<ThemeColorExtension> {
  const ThemeColorExtension({
    required this.primary,
    required this.primary_200,
    required this.primary_50,
    required this.primary_700,
    required this.secondary,
    required this.secondary_200,
    required this.secondary_50,
    required this.secondary_700,
    required this.gradientLigh,
    required this.gradientDark,
    this.confirmation_50 = const Color(0xFFeaf6ea),
    this.confirmation_400 = const Color(0xFF53b553),
    this.confirmation_500 = const Color(0xFF28a228),
    this.confirmation_700 = const Color(0xFF1c731c),
    this.atension_50 = const Color(0xFFfef7ed),
    this.atension_400 = const Color(0xFFf9c16e),
    this.atension_500 = const Color(0xFFf7b24a),
    this.atension_700 = const Color(0xFFaf7e35),
    this.error_50 = const Color(0xFFfceaea),
    this.error_400 = const Color(0xFFe35555),
    this.error_500 = const Color(0xFFdc2a2a),
    this.error_700 = const Color(0xFF9c1e1e),
    this.info_50 = const Color(0xFFe6effb),
    this.info_400 = const Color(0xFF387ddf),
    this.info_500 = const Color(0xFF065cd7),
    this.info_700 = const Color(0xFF044199),
    this.neutral_0 = const Color(0xFFffffff),
    this.neutral_50 = const Color(0xFFededed),
    this.neutral_100 = const Color(0xFFccced2),
    this.neutral_200 = const Color(0xFFb2b5bc),
    this.neutral_300 = const Color(0xFF8d929c),
    this.neutral_400 = const Color(0xFF5a606e),
    this.neutral_500 = const Color(0xFF394152),
    this.neutral_600 = const Color(0xFF081127),
  });

  final Color primary, primary_200, primary_50, primary_700;
  final Color secondary, secondary_200, secondary_50, secondary_700;
  final Color gradientLigh, gradientDark;
  List<Color> get gradient => [gradientLigh, gradientDark];

  factory ThemeColorExtension.fromJson(Map<String, dynamic> map) =>
      ThemeColorExtension(
        primary: ColorStringExtension.stringToColor(map['primary_color']) ??
            Env.primaryColor,
        primary_50: ColorStringExtension.stringToColor(map['primary_50']) ??
            Env.primaryColor50,
        primary_200: ColorStringExtension.stringToColor(map['primary_200']) ??
            Env.primaryColor200,
        primary_700: ColorStringExtension.stringToColor(map['primary_700']) ??
            Env.primaryColor700,
        secondary: ColorStringExtension.stringToColor(map['secondary_color']) ??
            Env.secondaryColor,
        secondary_50: ColorStringExtension.stringToColor(map['secondary_50']) ??
            Env.secondaryColor50,
        secondary_200:
            ColorStringExtension.stringToColor(map['secondary_200']) ??
                Env.secondaryColor200,
        secondary_700:
            ColorStringExtension.stringToColor(map['secondary_700']) ??
                Env.secondaryColor700,
        gradientLigh:
            ColorStringExtension.stringToColor(map['gradient_begin']) ??
                Env.primaryColor,
        gradientDark: ColorStringExtension.stringToColor(map['gradient_end']) ??
            Env.secondaryColor,
      );

  // Semantic colors
  final Color confirmation_50,
      confirmation_400,
      confirmation_500,
      confirmation_700,
      atension_50,
      atension_400,
      atension_500,
      atension_700,
      error_50,
      error_400,
      error_500,
      error_700,
      info_50,
      info_400,
      info_500,
      info_700,
      neutral_0,
      neutral_50,
      neutral_100,
      neutral_200,
      neutral_300,
      neutral_400,
      neutral_500,
      neutral_600;

  @override
  ThemeColorExtension copyWith({
    Color? primary,
    Color? primary_200,
    Color? primary_50,
    Color? primary_700,
    Color? secondary,
    Color? secondary_200,
    Color? secondary_50,
    Color? secondary_700,
    Color? gradientLigh,
    Color? gradientDark,
  }) =>
      ThemeColorExtension(
        primary: primary ?? this.primary,
        primary_200: primary_200 ?? this.primary_200,
        primary_50: primary_50 ?? this.primary_50,
        primary_700: primary_700 ?? this.primary_700,
        secondary: secondary ?? this.secondary,
        secondary_200: secondary_200 ?? this.secondary_200,
        secondary_50: secondary_50 ?? this.secondary_50,
        secondary_700: secondary_700 ?? this.secondary_700,
        gradientLigh: gradientLigh ?? this.gradientLigh,
        gradientDark: gradientDark ?? this.gradientDark,
      );

  // Controls how the properties change on theme changes
  @override
  ThemeColorExtension lerp(
      ThemeExtension<ThemeColorExtension>? other, double t) {
    if (other is! ThemeColorExtension) {
      return this;
    }
    return ThemeColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      primary_200: Color.lerp(primary_200, other.primary_200, t)!,
      primary_50: Color.lerp(primary_50, other.primary_50, t)!,
      primary_700: Color.lerp(primary_700, other.primary_700, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondary_200: Color.lerp(secondary_200, other.secondary_200, t)!,
      secondary_50: Color.lerp(secondary_50, other.secondary_50, t)!,
      secondary_700: Color.lerp(secondary_700, other.secondary_700, t)!,
      gradientLigh: Color.lerp(gradientLigh, other.gradientLigh, t)!,
      gradientDark: Color.lerp(gradientDark, other.gradientDark, t)!,
      confirmation_50: Color.lerp(confirmation_50, other.confirmation_50, t)!,
      confirmation_400:
          Color.lerp(confirmation_400, other.confirmation_400, t)!,
      confirmation_500:
          Color.lerp(confirmation_500, other.confirmation_500, t)!,
      confirmation_700:
          Color.lerp(confirmation_700, other.confirmation_700, t)!,
      atension_50: Color.lerp(atension_50, other.atension_50, t)!,
      atension_400: Color.lerp(atension_400, other.atension_400, t)!,
      atension_500: Color.lerp(atension_500, other.atension_500, t)!,
      atension_700: Color.lerp(atension_700, other.atension_700, t)!,
      error_50: Color.lerp(error_50, other.error_50, t)!,
      error_400: Color.lerp(error_400, other.error_400, t)!,
      error_500: Color.lerp(error_500, other.error_500, t)!,
      error_700: Color.lerp(error_700, other.error_700, t)!,
      info_50: Color.lerp(info_50, other.info_50, t)!,
      info_400: Color.lerp(info_400, other.info_400, t)!,
      info_500: Color.lerp(info_500, other.info_500, t)!,
      info_700: Color.lerp(info_700, other.info_700, t)!,
      neutral_0: Color.lerp(neutral_0, other.neutral_0, t)!,
      neutral_50: Color.lerp(neutral_50, other.neutral_50, t)!,
      neutral_100: Color.lerp(neutral_100, other.neutral_100, t)!,
      neutral_200: Color.lerp(neutral_200, other.neutral_200, t)!,
      neutral_300: Color.lerp(neutral_300, other.neutral_300, t)!,
      neutral_400: Color.lerp(neutral_400, other.neutral_400, t)!,
      neutral_500: Color.lerp(neutral_500, other.neutral_500, t)!,
      neutral_600: Color.lerp(neutral_600, other.neutral_600, t)!,
    );
  }

  static ThemeColorExtension of(context) =>
      Theme.of(context).extension<ThemeColorExtension>()!;
}

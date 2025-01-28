import 'package:flutter/material.dart';
import 'package:theme_config/theme_config.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ThemeColorExtension get colors => ThemeColorExtension.of(this);

  TextTheme get textTheme => theme.textTheme;
}

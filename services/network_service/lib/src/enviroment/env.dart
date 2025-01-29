import 'dart:ui';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:theme_config/theme_config.dart';

enum EnvironmentType { dev, qa, prod }

class Env {
  static Future<void> init(
      [EnvironmentType type = EnvironmentType.prod]) async {
    await dotenv.load(fileName: _fileName(type));
  }

  static String _fileName(EnvironmentType type) => switch (type) {
        EnvironmentType.dev => '.env.dev',
        EnvironmentType.qa => '.env.qa',
        EnvironmentType.prod => '.env.prod',
      };

  //Env variables
  // App configs
  static String get appTitle => dotenv.get('APP_TITLE');

  // Network config
  static String get host => dotenv.get('HOST');
  static String get prefix => dotenv.get('PREFIX');
  static int get port => dotenv.getInt('PORT');
  static bool get useHttps => dotenv.getBool('IS_HTTPS');

  // Links
  static String get termsUrl => dotenv.get('TERMS_URL');
  static String get privacyUrl => dotenv.get('PRIVACY_URL');

  // Colors
  static Color get primaryColor =>
      ColorStringExtension.stringToColor(dotenv.get('PRIMARY'))!;
  static Color get primaryColor50 =>
      ColorStringExtension.stringToColor(dotenv.get('PRIMARY_50'))!;
  static Color get primaryColor200 =>
      ColorStringExtension.stringToColor(dotenv.get('PRIMARY_200'))!;
  static Color get primaryColor700 =>
      ColorStringExtension.stringToColor(dotenv.get('PRIMARY_700'))!;
  static Color get secondaryColor =>
      ColorStringExtension.stringToColor(dotenv.get('SECONDARY'))!;
  static Color get secondaryColor50 =>
      ColorStringExtension.stringToColor(dotenv.get('SECONDARY_50'))!;
  static Color get secondaryColor200 =>
      ColorStringExtension.stringToColor(dotenv.get('SECONDARY_200'))!;
  static Color get secondaryColor700 =>
      ColorStringExtension.stringToColor(dotenv.get('SECONDARY_700'))!;
  static Color get gradientLight =>
      ColorStringExtension.stringToColor(dotenv.get('GRADIENT_LIGHT'))!;
  static Color get gradientDark =>
      ColorStringExtension.stringToColor(dotenv.get('GRADIENT_DARK'))!;
}

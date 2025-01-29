import 'package:network_service/network_service.dart';
import 'package:theme_config/theme_config.dart';

class AppConfig {
  final String appTitle;
  final ThemeColorExtension colors;
  final ApiConfig apiConfigBase;
  final String termsUrl;
  final String privacyUrl;

  const AppConfig({
    required this.appTitle,
    required this.apiConfigBase,
    required this.termsUrl,
    required this.privacyUrl,
    required this.colors,
  });

  factory AppConfig.fromMap(Map<String, dynamic> map) {
    final apiConfigBase = ApiConfig.fromJson(map);
    final colors = ThemeColorExtension.fromJson(map['colors']);
    return AppConfig(
      appTitle: map['appTitle'] ?? Env.appTitle,
      apiConfigBase: apiConfigBase,
      termsUrl: map['termsUrl'] ?? Env.termsUrl,
      privacyUrl: map['privacyUrl'] ?? Env.privacyUrl,
      colors: colors,
    );
  }
}

import 'package:network_service/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_config/theme_config.dart';

part 'app_flavor_provider.g.dart';

@Riverpod(keepAlive: true)
AppConfig appFlavor(Ref ref) {
  return AppConfig(
    appTitle: Env.appTitle,
    colors: ThemeColorExtension(
      primary: Env.primaryColor,
      primary_50: Env.primaryColor50,
      primary_200: Env.primaryColor200,
      primary_700: Env.primaryColor700,
      secondary: Env.secondaryColor,
      secondary_50: Env.secondaryColor50,
      secondary_200: Env.secondaryColor200,
      secondary_700: Env.secondaryColor700,
      gradientLigh: Env.gradientLight,
      gradientDark: Env.gradientDark,
    ),
    apiConfigBase: ApiConfig(
      host: Env.host,
      prefix: Env.prefix,
      useHttps: Env.useHttps,
    ),

    // links
    termsUrl: Env.termsUrl,
    privacyUrl: Env.privacyUrl,
  );
}

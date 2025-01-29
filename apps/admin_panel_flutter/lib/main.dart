import 'dart:io';

import 'package:admin_panel_flutter/config/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_service/network_service.dart';
import 'package:theme_config/theme_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Env.init(EnvironmentType.dev);
  runApp(
    ProviderScope(
      child: const MyAdminPanel(),
    ),
  );
}

class MyAdminPanel extends ConsumerWidget {
  const MyAdminPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: ref.watch(appFlavorProvider).appTitle,

      // locale: Locale('en'),
      // supportedLocales: [
      //   Locale('en'),
      // ],
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   FormBuilderLocalizations.delegate,
      //   AuthLocalizations.delegate,
      //   ActivityLocalizations.delegate,
      //   OnboardingLocalizations.delegate,
      //   ProfileLocalizations.delegate,
      //   NotificationLocalizations.delegate,
      // ],

      theme: AppTheme.getTheme(
        brightness: Brightness.light,
        extension: ref.watch(appFlavorProvider).colors,
      ),
      // darkTheme: AppTheme.getTheme(
      //   brightness: Brightness.dark,
      //   extension: ref.watch(appFlavorProvider).colors,
      // ),
      // themeMode: ref.watch(colorThemeProvider),

      routerConfig: router,

      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.linear(
            Platform.isIOS || Platform.isMacOS ? .9 : 1,
          ),
        ),
        child: child ?? SizedBox(),
      ),
    );
  }
}

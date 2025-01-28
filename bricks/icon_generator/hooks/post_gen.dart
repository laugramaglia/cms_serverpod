import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) {
  // Run `flutter pub get` to fetch added dependencies
  final dep = Process.runSync('flutter', ['pub', 'get']);
  if (dep.exitCode == 0) {
    print('✅ Dependencies fetched successfully.');
  } else {
    print('❌ Failed to fetch dependencies: ${dep.stderr}');
  }

  final icon = Process.runSync(
      'dart', ['run', 'flutter_launcher_icons', '-f', 'launcher_icon.yaml']);

  if (icon.exitCode != 0) {
    print('❌ Error generating icon: ${icon.stderr}');
  } else {
    print('✅ icon generated');
  }

  final splash = Process.runSync('dart',
      ['run', 'flutter_native_splash:create', '--path=launcher_splash.yaml']);

  if (splash.exitCode != 0) {
    print('❌ Error generating splash: ${splash.stderr}');
  } else {
    print('✅ splash generated');
  }
}

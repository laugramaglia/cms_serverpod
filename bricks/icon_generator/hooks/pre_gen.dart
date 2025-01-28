import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) {
  final icon = Process.runSync(
      'flutter', ['pub', 'add', 'flutter_launcher_icons', '--dev']);

  if (icon.exitCode != 0) {
    print('❌ Error adding flutter_launcher_icons: ${icon.stderr}');
  } else {
    print('✅ flutter_launcher_icons added');
  }

  final splash = Process.runSync(
      'flutter', ['pub', 'add', 'flutter_native_splash', '--dev']);

  if (splash.exitCode != 0) {
    print('❌ Error adding flutter_native_splash: ${splash.stderr}');
  } else {
    print('✅ flutter_native_splash added');
  }
}

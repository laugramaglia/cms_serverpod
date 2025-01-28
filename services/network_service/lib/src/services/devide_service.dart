import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

mixin DeviceService {
  Future<String?> getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.id; // Android device ID
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor; // iOS identifier
      }
    } catch (e) {
      log('Error getting device ID: $e');
    }

    return null;
  }
}

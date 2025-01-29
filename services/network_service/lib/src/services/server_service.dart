import 'package:cms_serverpod_client/cms_serverpod_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_service/network_service.dart';
import 'package:network_service/src/services/devide_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:theme_config/theme_config.dart';

part 'server_service.g.dart';

class ServerService with DeviceService {
  final ApiConfig config;
  late final Client client;

  ServerService(this.config) {
    // Create a client object to talk to the server
    client = Client(
      '${config.baseUrlwithPort}/',
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();
  }
}

@Riverpod()
SessionManager sessionManager(Ref ref) {
  final client =
      ServerService(ref.watch(appFlavorProvider).apiConfigBase).client;
  return SessionManager(
    caller: client.modules.auth,
  );
}

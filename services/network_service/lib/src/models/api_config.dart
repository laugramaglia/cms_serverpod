import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:network_service/src/enviroment/env.dart';

class ApiConfig {
  final String host;
  final int port;
  final String prefix;
  final bool useHttps;

  final Map<String, dynamic>? headers;

  const ApiConfig({
    required this.host,
    this.port = 80,
    required this.prefix,
    required this.useHttps,
    this.headers,
  });

  String get userAccount => 'userAccount unimplemented';

  String get baseUrl =>
      '${useHttps ? 'https://' : 'http://'}${!kIsWeb && Platform.isAndroid && [
            'localhost',
            '127.0.0.1'
          ].contains(host) ? '10.0.2.2' : host}';

  String get baseApiUrl => '$baseUrl$prefix';

  String get baseUrlwithPort => '$baseUrl:$port';

  factory ApiConfig.fromJson(Map<String, dynamic> json) => ApiConfig(
        host: json['host'] ?? Env.host,
        prefix: json['prefix'] ?? Env.prefix,
        useHttps: json['useHttps'] ?? Env.useHttps,
      );

  @override
  String toString() =>
      'ApiConfig(host: $host, prefix: $prefix, useHttps: $useHttps)';
}

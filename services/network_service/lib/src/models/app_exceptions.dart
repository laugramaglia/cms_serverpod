import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppException implements Exception {
  final String? message;
  final int? code;
  final String identifier;
  final Response? response;

  AppException({
    required this.message,
    required this.code,
    required this.identifier,
    this.response,
  });

  @override
  String toString() =>
      // if is debug mode

      "$identifier( $code )${kDebugMode && message != null && message!.isNotEmpty ? ': $message' : ''}";
}

class UserExeption extends AppException {
  UserExeption(String message)
      : super(
          message: message,
          code: 500,
          identifier: 'user-exception',
        );
}

class AuthExeption extends AppException {
  AuthExeption([String? message])
      : super(
          message: message ??
              'Alguno de los datos ingresados es incorrecto.\nRevísalos e intenta nuevamente.',
          code: 400,
          identifier: 'auth-exception',
        );
}

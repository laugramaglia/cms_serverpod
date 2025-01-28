import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:network_service/network_service.dart';

class AuthInterceptor extends Interceptor {
  final TokenService tokenService;

  AuthInterceptor(this.tokenService);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenService.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // log('Request: ${options.method} ${options.uri}\nHeaders: ${options.headers}\nBody: ${jsonEncode(options.data)}');

    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final newToken = await tokenService.refreshToken();
        if (newToken != null) {
          // Clone and update the original request
          final retryRequest = err.requestOptions;
          retryRequest.headers['Authorization'] = 'Bearer $newToken';

          final response = await tokenService.dio.fetch(retryRequest);
          handler.resolve(response);
          return;
        }
        tokenService.clearTokens();
      } catch (e) {
        // Token refresh failed, likely needs full re-authentication
        tokenService.clearTokens();
      }
    }
    handler.next(err);
  }
}

class TokenService {
  final Dio dio;
  TokenService(ApiConfig config)
      : dio = Dio(BaseOptions(
          baseUrl: config.baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));

  Future<String?> getAccessToken() async {
    // final userData = _realm.userData.firstOrNull;
    // return userData?.accessToken;
    return null;
  }

  Future<String?> refreshToken() async {
    try {
      // final currentUser = _realm.userData.firstOrNull;
      //if (currentUser == null)
      return null;
      // final getDeviceId = await _getDeviceId();

      // final response = await dio.get(
      //   '/WalletCoreUser/refreshToken',
      //   options: Options(
      //     headers: {
      //       'X-Middleware-DeviceId': getDeviceId,
      //       'Authorization': 'Bearer ${currentUser.refreshToken}',
      //     },
      //   ),
      // );

      // if (response.statusCode == 200) {
      //   final newAccessToken = response.data['token'];
      //   final newExpiration = DateTime.parse(response.data['expiration']);

      //   // Update Realm with new tokens
      //   _realm.realm.write(
      //     () => _realm.realm.add(
      //       currentUser
      //         ..accessToken = newAccessToken
      //         ..accessTokenExpiration = newExpiration,

      //       // ..refreshToken =
      //       //     response.data['refreshToken'] ?? currentUser.refreshToken
      //       // ..refreshTokenExpiration =
      //       //     DateTime.tryParse(response.data['refreshExpiration']) ??
      //       //         currentUser.refreshTokenExpiration,

      //       update: true,
      //     ),
      //   );

      //   return newAccessToken;
      // }
      // clearTokens();
      // return null;
    } catch (e) {
      log(e.toString());
      clearTokens();
      return null;
    }
  }

  void clearTokens() {
    // final currentUser = _realm.userData.firstOrNull;
    // if (currentUser != null) {
    //   _realm.realm.write(
    //     () => _realm.realm.delete<UserSecureData>(currentUser),
    //   );
    // }
  }
}

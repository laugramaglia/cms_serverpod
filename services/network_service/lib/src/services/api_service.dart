import 'package:dio/dio.dart';
import 'package:network_service/network_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:network_service/src/interseptors/auth_interceptor.dart';
import 'package:network_service/src/services/devide_service.dart';

sealed class ApiService {
  final ApiConfig config;
  const ApiService(this.config);

  Dio emptyDio(String baseUrl, {Map<String, dynamic>? headers});
  Future<Either<AppException, Response<T>>> post<T>(String endpoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body});

  Future<Either<AppException, Response<T>>> get<T>(String endpoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});

  Future<Either<AppException, Response<T>>> put<T>(String endpoint,
      {Map<String, dynamic>? body});
}

class ApiServiceImpl with DeviceService implements ApiService {
  @override
  final ApiConfig config;

  final Dio dio;

  ApiServiceImpl(this.config)
      : dio = Dio(
          BaseOptions(
              baseUrl: config.baseUrlwithPort,
              followRedirects: false,
              validateStatus: (status) =>
                  status != null && status >= 200 && status < 400,
              headers: config.headers ??
                  {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                  }),
        )..interceptors.addAll([AuthInterceptor(TokenService(config))]);

  @override
  Future<Either<AppException, Response<T>>> post<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    // add device id
    final deviceId = await getDeviceId();
    final finalHeaders = headers ?? {};
    finalHeaders.addAll({'X-Middleware-DeviceId': deviceId});

    //  make a call
    return safeHttpCall<T>(() => dio.post<T>(endpoint,
        data: body, options: Options(headers: finalHeaders)));
  }

  @override
  Future<Either<AppException, Response<T>>> get<T>(String endpoint,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    // add device id
    final finalHeaders = headers ?? {};
    finalHeaders.addAll({'X-Middleware-DeviceId': await getDeviceId()});

    //  make a call
    return safeHttpCall<T>(() => dio.get<T>(endpoint,
        queryParameters: queryParameters,
        options: Options(headers: finalHeaders)));
  }

  @override
  Future<Either<AppException, Response<T>>> put<T>(String endpoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) async {
    // add device id
    final finalHeaders = headers ?? {};
    finalHeaders.addAll({'X-Middleware-DeviceId': await getDeviceId()});

    return safeHttpCall<T>(() => dio.put<T>(endpoint,
        data: body, options: Options(headers: finalHeaders)));
  }

  @override
  Dio emptyDio(String baseUrl, {Map<String, dynamic>? headers}) =>
      Dio(BaseOptions(baseUrl: baseUrl, headers: headers));
}

extension on ApiServiceImpl {
  // Generic function for handling HTTP requests functionally
  Future<Either<AppException, Response<T>>> safeHttpCall<T>(
    Future<Response<T>> Function() httpRequest,
  ) async {
    try {
      final response = await httpRequest();

      return Right(response);
    } on DioException catch (e) {
      return Left(AppException(
        code: e.response?.statusCode,
        response: e.response,
        message: (e.response?.data ?? e.error).toString(),
        identifier: 'network-exception',
      ));
    } catch (e) {
      return Left(AppException(
        code: 500,
        message: e.toString(),
        identifier: 'unknown-network-exception',
      ));
    }
  }
}

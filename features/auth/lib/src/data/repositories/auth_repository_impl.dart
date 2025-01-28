import 'package:auth/src/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:network_service/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

@Riverpod()
AuthRepository authRepository(Ref ref) {
  final apiConfig = ApiConfig(
    host: 'localhost',
    prefix: '',
    port: 8080,
    useHttps: false,
  );
  return AuthRepositoryImpl(
    apiService: ApiServiceImpl(apiConfig),
    serverService: ServerService(apiConfig),
  );
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiServiceImpl apiService;
  final ServerService serverService;

  AuthRepositoryImpl({
    required this.apiService,
    required this.serverService,
  });

  @override
  Future<Either<AppException, String>> login(String req) async {
    try {
      final response = await serverService.client.example.hello(req);

      return right(response.toString());
    } catch (e) {
      return left(AppException(
        code: 500,
        message: e.toString(),
        identifier: 'unknown-network-exception',
      ));
    }
  }
}

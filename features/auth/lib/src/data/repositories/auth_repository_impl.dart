import 'package:auth/src/data/models/email_login_req.dart';
import 'package:auth/src/domain/repositories/auth_repository.dart';
import 'package:cms_serverpod_client/cms_serverpod_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:network_service/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:theme_config/theme_config.dart';

part 'auth_repository_impl.g.dart';

@Riverpod()
AuthRepository authRepository(Ref ref) {
  final flavor = ref.watch(appFlavorProvider);
  return AuthRepositoryImpl(
    apiService: ApiServiceImpl(flavor.apiConfigBase),
    serverService: ServerService(flavor.apiConfigBase),
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
  Future<Either<ApiException, User?>> emailLogin(EmailLoginReq req) async {
    try {
      final response = await serverService.client.auth
          .loginWithEmail(req.email, req.password);

      return right(response);
    } on ApiException catch (e) {
      return left(e);
    } catch (e) {
      return left(ApiException(
          status: 'INTERNAL_ERROR',
          errorCode: 500,
          message: 'Internal server error',
          details: [
            ErrorDetail(
              type: 'INTERNAL_ERROR',
              message: e.toString(),
            ),
          ]));
    }
  }
}

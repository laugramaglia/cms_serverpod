import 'package:auth/src/data/models/email_login_req.dart';
import 'package:cms_serverpod_client/cms_serverpod_client.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<ApiException, User?>> emailLogin(EmailLoginReq req);
}

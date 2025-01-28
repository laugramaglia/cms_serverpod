import 'package:fpdart/fpdart.dart';
import 'package:network_service/network_service.dart';

abstract class AuthRepository {
  Future<Either<AppException, String>> login(String req);
}

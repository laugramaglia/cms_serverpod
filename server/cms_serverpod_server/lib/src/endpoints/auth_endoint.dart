import 'package:cms_serverpod_server/src/mixins/api_exception_handler.dart';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart'; // Your custom User model

class AuthEndpoint extends Endpoint with ApiExceptionHandler {
  Future<User?> loginWithEmail(
      Session session, String? email, String? password) async {
    // Validate parameters
    validateMissingParams([
      (key: 'email', val: email),
      (key: 'password', val: password),
    ]);

    // Handle the request
    return await handleAsyncException<User?>(
      () async {
        // Authenticate using serverpod_auth
        final user = User(
          username: 'Laureano',
          email: 'lau@gmail.com',
          password: 'password',
          roleId: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        return user;
      },
    );
  }
}

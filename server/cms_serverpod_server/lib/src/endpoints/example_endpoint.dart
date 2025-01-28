import 'package:cms_serverpod_server/src/generated/example.dart';
import 'package:cms_serverpod_server/src/mixins/api_exception_handler.dart';

import 'package:serverpod/serverpod.dart';

class ExampleEndpoint extends Endpoint with ApiExceptionHandler {
  Future<Example> hello(Session session, String? name) async {
    // Validate parameters
    validateMissingParams([(key: 'name', val: name)]);

    // Handle the request
    return handleAsyncException<Example>(
      () async {
        return Example(
          name: '$name is authenticated: ${await session.isUserSignedIn}',
          data: 112,
        );
      },
    );
  }
}

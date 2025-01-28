import 'package:cms_serverpod_server/src/generated/api_exception.dart';
import 'package:cms_serverpod_server/src/generated/error_detail.dart';

mixin ApiExceptionHandler {
  /// Throws an [ApiException] if any required parameters are missing or empty.
  void validateMissingParams(List<({String? val, String? key})> values) {
    // Collect all missing parameters
    final missing =
        values.where((value) => value.val?.isEmpty ?? true).toList();

    if (missing.isNotEmpty) {
      throw ApiException(
        message: 'Invalid request',
        errorCode: 400,
        status: 'INVALID_ARGUMENT',
        details: [
          for (final value in missing)
            ErrorDetail(
              type: 'ValidationError',
              message:
                  '${value.key} field cannot be ${value.val == null ? 'null' : 'empty'}',
            ),
        ],
      );
    }
  }

  /// Wraps the given function or value in a try-catch block and throws an [ApiException] on error.
  T handleException<T>(T Function() function) {
    try {
      return function();
    } catch (e, stackTrace) {
      // Log the error if necessary
      print('Error occurred: $e\nStackTrace: $stackTrace');

      throw ApiException(
        message: 'Internal server error',
        errorCode: 500,
        status: 'INTERNAL',
        details: [
          ErrorDetail(
            type: 'UnknownError',
            message: e.toString(),
          ),
        ],
      );
    }
  }

  /// Wraps an asynchronous function in a try-catch block and throws an [ApiException] on error.
  Future<T> handleAsyncException<T>(Future<T> Function() function) async {
    try {
      return await function();
    } catch (e, stackTrace) {
      // Log the error if necessary
      print('Error occurred: $e\nStackTrace: $stackTrace');

      throw ApiException(
        message: 'Internal server error',
        errorCode: 500,
        status: 'INTERNAL',
        details: [
          ErrorDetail(
            type: 'UnknownError',
            message: e.toString(),
          ),
        ],
      );
    }
  }
}

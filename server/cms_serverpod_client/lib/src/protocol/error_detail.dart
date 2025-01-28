/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ErrorDetail
    implements _i1.SerializableException, _i1.SerializableModel {
  ErrorDetail._({
    required this.message,
    required this.type,
  });

  factory ErrorDetail({
    required String message,
    required String type,
  }) = _ErrorDetailImpl;

  factory ErrorDetail.fromJson(Map<String, dynamic> jsonSerialization) {
    return ErrorDetail(
      message: jsonSerialization['message'] as String,
      type: jsonSerialization['type'] as String,
    );
  }

  String message;

  String type;

  ErrorDetail copyWith({
    String? message,
    String? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'type': type,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ErrorDetailImpl extends ErrorDetail {
  _ErrorDetailImpl({
    required String message,
    required String type,
  }) : super._(
          message: message,
          type: type,
        );

  @override
  ErrorDetail copyWith({
    String? message,
    String? type,
  }) {
    return ErrorDetail(
      message: message ?? this.message,
      type: type ?? this.type,
    );
  }
}

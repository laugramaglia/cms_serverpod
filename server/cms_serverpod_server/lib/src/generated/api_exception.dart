/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'error_detail.dart' as _i2;

abstract class ApiException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  ApiException._({
    required this.message,
    required this.errorCode,
    required this.status,
    required this.details,
  });

  factory ApiException({
    required String message,
    required int errorCode,
    required String status,
    required List<_i2.ErrorDetail> details,
  }) = _ApiExceptionImpl;

  factory ApiException.fromJson(Map<String, dynamic> jsonSerialization) {
    return ApiException(
      message: jsonSerialization['message'] as String,
      errorCode: jsonSerialization['errorCode'] as int,
      status: jsonSerialization['status'] as String,
      details: (jsonSerialization['details'] as List)
          .map((e) => _i2.ErrorDetail.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  String message;

  int errorCode;

  String status;

  List<_i2.ErrorDetail> details;

  ApiException copyWith({
    String? message,
    int? errorCode,
    String? status,
    List<_i2.ErrorDetail>? details,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errorCode': errorCode,
      'status': status,
      'details': details.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'message': message,
      'errorCode': errorCode,
      'status': status,
      'details': details.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ApiExceptionImpl extends ApiException {
  _ApiExceptionImpl({
    required String message,
    required int errorCode,
    required String status,
    required List<_i2.ErrorDetail> details,
  }) : super._(
          message: message,
          errorCode: errorCode,
          status: status,
          details: details,
        );

  @override
  ApiException copyWith({
    String? message,
    int? errorCode,
    String? status,
    List<_i2.ErrorDetail>? details,
  }) {
    return ApiException(
      message: message ?? this.message,
      errorCode: errorCode ?? this.errorCode,
      status: status ?? this.status,
      details: details ?? this.details.map((e0) => e0.copyWith()).toList(),
    );
  }
}

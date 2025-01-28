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
import 'api_exception.dart' as _i2;
import 'error_detail.dart' as _i3;
import 'example.dart' as _i4;
export 'api_exception.dart';
export 'error_detail.dart';
export 'example.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.ApiException) {
      return _i2.ApiException.fromJson(data) as T;
    }
    if (t == _i3.ErrorDetail) {
      return _i3.ErrorDetail.fromJson(data) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ApiException?>()) {
      return (data != null ? _i2.ApiException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.ErrorDetail?>()) {
      return (data != null ? _i3.ErrorDetail.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data) : null) as T;
    }
    if (t == List<_i3.ErrorDetail>) {
      return (data as List).map((e) => deserialize<_i3.ErrorDetail>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.ApiException) {
      return 'ApiException';
    }
    if (data is _i3.ErrorDetail) {
      return 'ErrorDetail';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'ApiException') {
      return deserialize<_i2.ApiException>(data['data']);
    }
    if (dataClassName == 'ErrorDetail') {
      return deserialize<_i3.ErrorDetail>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}

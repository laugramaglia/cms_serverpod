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

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    this.googleId,
    required this.roleId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User({
    int? id,
    required String username,
    required String email,
    required String password,
    String? googleId,
    required int roleId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      username: jsonSerialization['username'] as String,
      email: jsonSerialization['email'] as String,
      password: jsonSerialization['password'] as String,
      googleId: jsonSerialization['googleId'] as String?,
      roleId: jsonSerialization['roleId'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String username;

  String email;

  String password;

  String? googleId;

  int roleId;

  DateTime createdAt;

  DateTime updatedAt;

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? googleId,
    int? roleId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'username': username,
      'email': email,
      'password': password,
      if (googleId != null) 'googleId': googleId,
      'roleId': roleId,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String username,
    required String email,
    required String password,
    String? googleId,
    required int roleId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          username: username,
          email: email,
          password: password,
          googleId: googleId,
          roleId: roleId,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? username,
    String? email,
    String? password,
    Object? googleId = _Undefined,
    int? roleId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id is int? ? id : this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      googleId: googleId is String? ? googleId : this.googleId,
      roleId: roleId ?? this.roleId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

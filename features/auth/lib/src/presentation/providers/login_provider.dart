import 'package:auth/src/data/models/email_login_req.dart';
import 'package:auth/src/data/repositories/auth_repository_impl.dart';
import 'package:cms_serverpod_client/cms_serverpod_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@Riverpod()
Future<User?> login(Ref ref, EmailLoginReq req) async {
  final response = await ref.read(authRepositoryProvider).emailLogin(req);

  return response.fold(
    (l) => throw l,
    (r) => r,
  );
}

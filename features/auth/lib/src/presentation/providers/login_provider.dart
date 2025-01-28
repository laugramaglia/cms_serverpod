import 'package:auth/src/data/repositories/auth_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@Riverpod()
Future<String> login(Ref ref, String req) async {
  final response = await ref.read(authRepositoryProvider).login(req);

  return response.fold(
    (l) => 'Error: ${l.message}',
    (r) => r,
  );
}

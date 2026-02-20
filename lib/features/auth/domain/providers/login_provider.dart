import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/login_provider.g.dart';

@riverpod
Future<bool> login(Ref ref, {required String email, required String password}) {
  return Future.value(true);
}

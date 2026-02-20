// core/resources/dio_provider.dart
import 'package:fl_subscriber/core/resources/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/dio_provider.g.dart';

@Riverpod(keepAlive: true)
DioClient dioClient(Ref ref) {
  return DioClient();
}

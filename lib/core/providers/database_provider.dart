import 'package:fl_subscriber/core/resources/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
}

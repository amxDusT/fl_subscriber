import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'generated/app_database.g.dart';

class SubscriptionsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get serviceId => text()();
  TextColumn get serviceName => text()();
  IntColumn get iconCodePoint => integer()();
  TextColumn get iconFontFamily =>
      text().withDefault(const Constant('MaterialIcons'))();
  IntColumn get colorValue => integer()();
  RealColumn get amount => real()();
  TextColumn get currency => text().withDefault(const Constant('EUR'))();
  TextColumn get planName => text().nullable()();
  TextColumn get frequency => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get nextPaymentDate => dateTime()();
  TextColumn get logoAsset => text().nullable()();
  TextColumn get category => text().nullable()();
  IntColumn get alertDaysBefore => integer().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [SubscriptionsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from < 2) {
            await migrator.addColumn(
                subscriptionsTable, subscriptionsTable.logoAsset);
            await migrator.addColumn(
                subscriptionsTable, subscriptionsTable.category);
          }
        },
      );

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'fl_subscriber.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}

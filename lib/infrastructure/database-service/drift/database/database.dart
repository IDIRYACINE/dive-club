import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'helpers.dart';

part 'database.g.dart';

@DriftDatabase(
  include: {'tables.drift'},
)
class AppDb extends _$AppDb {
  static AppDb? _instance;

  AppDb._() : super(_openConnection());

  factory AppDb.instance() {
    _instance ??= AppDb._();

    return _instance!;
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = await copyDatabase();

    return NativeDatabase.createInBackground(file);
  });
}

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../domain/habit_definition.dart' show FrequencyPeriod;
import 'tables/habit_definitions.dart';
import 'tables/habit_logs.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [HabitDefinitions, HabitLogs])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'habit_tracker'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

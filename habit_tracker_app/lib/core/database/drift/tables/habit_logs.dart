import 'package:drift/drift.dart';

import 'habit_definitions.dart';

@DataClassName('HabitLogRow')
class HabitLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get habitDefinitionId =>
      integer().references(HabitDefinitions, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get loggedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get note => text().nullable()();
}

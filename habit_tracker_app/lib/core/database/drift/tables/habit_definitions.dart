import 'package:drift/drift.dart';

import '../../../domain/habit_definition.dart' show FrequencyPeriod;

@DataClassName('HabitDefinitionRow')
class HabitDefinitions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().withDefault(const Constant(''))();

  /// Habit should be logged [frequencyCount] times per [frequencyPeriod].
  // ignore: recursive_getters
  IntColumn get frequencyCount => integer().check(frequencyCount.isBiggerThanValue(0))();
  TextColumn get frequencyPeriod => textEnum<FrequencyPeriod>()();

  DateTimeColumn get startDate => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get endDate => dateTime().nullable()();

  /// Minutes since midnight for the reminder; null = no notification.
  IntColumn get notificationTimeMinutes => integer().nullable()();

  /// Position in the user-ordered habit list.
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  
  /// Most recent log date for this habit. Updated when logging occurs.
  DateTimeColumn get lastRecordedAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

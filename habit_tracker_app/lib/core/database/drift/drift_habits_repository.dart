import 'package:drift/drift.dart';

import '../../domain/habit_definition.dart';
import '../../domain/habit_log.dart';
import '../../domain/habits_repository.dart';
import 'app_database.dart';

/// [HabitsRepository] backed by drift.
class DriftHabitsRepository implements HabitsRepository {
  DriftHabitsRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<HabitDefinition>> watchHabits() {
    final query = _db.select(_db.habitDefinitions)
      ..orderBy([(t) => OrderingTerm.asc(t.sortOrder), (t) => OrderingTerm.asc(t.id)]);
    return query.watch().map((rows) => rows.map(_toHabit).toList());
  }

  @override
  Future<HabitDefinition?> getHabit(int id) async {
    final row = await (_db.select(_db.habitDefinitions)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _toHabit(row);
  }

  @override
  Future<HabitDefinition> createHabit(NewHabitDefinition habit) async {
    final maxSort = _db.habitDefinitions.sortOrder.max();
    final current = await (_db.selectOnly(_db.habitDefinitions)..addColumns([maxSort]))
        .map((r) => r.read(maxSort))
        .getSingle();
    final row = await _db.into(_db.habitDefinitions).insertReturning(
          HabitDefinitionsCompanion.insert(
            name: habit.name,
            description: Value(habit.description),
            frequencyCount: habit.frequencyCount,
            frequencyPeriod: habit.frequencyPeriod,
            startDate: Value.absentIfNull(habit.startDate),
            endDate: Value(habit.endDate),
            notificationTimeMinutes: Value(habit.notificationTimeMinutes),
            sortOrder: Value(current == null ? 0 : current + 1),
          ),
        );
    return _toHabit(row);
  }

  @override
  Future<void> updateHabit(HabitDefinition habit) {
    return (_db.update(_db.habitDefinitions)..where((t) => t.id.equals(habit.id))).write(
      HabitDefinitionsCompanion(
        name: Value(habit.name),
        description: Value(habit.description),
        frequencyCount: Value(habit.frequencyCount),
        frequencyPeriod: Value(habit.frequencyPeriod),
        startDate: Value(habit.startDate),
        endDate: Value(habit.endDate),
        notificationTimeMinutes: Value(habit.notificationTimeMinutes),
        sortOrder: Value(habit.sortOrder),
      ),
    );
  }

  @override
  Future<void> deleteHabit(int id) async {
    await (_db.delete(_db.habitDefinitions)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> reorderHabits(List<int> orderedIds) {
    return _db.transaction(() async {
      for (var i = 0; i < orderedIds.length; i++) {
        await (_db.update(_db.habitDefinitions)..where((t) => t.id.equals(orderedIds[i])))
            .write(HabitDefinitionsCompanion(sortOrder: Value(i)));
      }
    });
  }

  @override
  Stream<List<HabitLog>> watchLogs(int habitId) {
    final query = _db.select(_db.habitLogs)
      ..where((t) => t.habitDefinitionId.equals(habitId))
      ..orderBy([(t) => OrderingTerm.desc(t.loggedAt)]);
    return query.watch().map((rows) => rows.map(_toLog).toList());
  }

  @override
  Future<HabitLog> addLog(int habitId, {DateTime? at, String? note}) {
    return _db.transaction(() async {
      final row = await _db.into(_db.habitLogs).insertReturning(
            HabitLogsCompanion.insert(
              habitDefinitionId: habitId,
              loggedAt: Value.absentIfNull(at),
              note: Value(note),
            ),
          );
      await _refreshLastRecordedAt(habitId);
      return _toLog(row);
    });
  }

  @override
  Future<void> deleteLog(int logId) {
    return _db.transaction(() async {
      final row = await (_db.select(_db.habitLogs)..where((t) => t.id.equals(logId)))
          .getSingleOrNull();
      if (row == null) return;
      await (_db.delete(_db.habitLogs)..where((t) => t.id.equals(logId))).go();
      await _refreshLastRecordedAt(row.habitDefinitionId);
    });
  }

  /// Keeps the denormalized [HabitDefinitions.lastRecordedAt] in sync with logs.
  Future<void> _refreshLastRecordedAt(int habitId) async {
    final latest = _db.habitLogs.loggedAt.max();
    final result = await (_db.selectOnly(_db.habitLogs)
          ..addColumns([latest])
          ..where(_db.habitLogs.habitDefinitionId.equals(habitId)))
        .getSingle();
    await (_db.update(_db.habitDefinitions)..where((t) => t.id.equals(habitId)))
        .write(HabitDefinitionsCompanion(lastRecordedAt: Value(result.read(latest))));
  }

  HabitDefinition _toHabit(HabitDefinitionRow r) => HabitDefinition(
        id: r.id,
        name: r.name,
        description: r.description,
        frequencyCount: r.frequencyCount,
        frequencyPeriod: r.frequencyPeriod,
        startDate: r.startDate,
        endDate: r.endDate,
        notificationTimeMinutes: r.notificationTimeMinutes,
        sortOrder: r.sortOrder,
        lastRecordedAt: r.lastRecordedAt,
      );

  HabitLog _toLog(HabitLogRow r) => HabitLog(
        id: r.id,
        habitDefinitionId: r.habitDefinitionId,
        loggedAt: r.loggedAt,
        note: r.note,
      );
}

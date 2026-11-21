import 'habit_definition.dart';
import 'habit_log.dart';

/// Storage abstraction for habits and their logs. The app depends only on
/// this interface; implementations (drift, remote API, ...) live elsewhere.
abstract interface class HabitsRepository {
  Stream<List<HabitDefinition>> watchHabits();
  Future<HabitDefinition?> getHabit(int id);
  Future<HabitDefinition> createHabit(NewHabitDefinition habit);
  Future<void> updateHabit(HabitDefinition habit);

  /// Also deletes the habit's logs.
  Future<void> deleteHabit(int id);

  /// Persists the order of habits as given by [orderedIds].
  Future<void> reorderHabits(List<int> orderedIds);

  Stream<List<HabitLog>> watchLogs(int habitId);
  Future<HabitLog> addLog(int habitId, {DateTime? at, String? note});
  Future<void> deleteLog(int logId);
}

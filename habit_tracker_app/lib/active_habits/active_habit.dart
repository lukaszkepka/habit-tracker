import '../core/domain/habit_definition.dart';

/// One row in the active habits list (UI-facing model).
class ActiveHabit {
  const ActiveHabit({
    required this.id,
    required this.name,
    required this.lastRecordDate,
    required this.started,
  });

  factory ActiveHabit.fromDefinition(HabitDefinition habit) {
    return ActiveHabit(
      id: habit.id,
      name: habit.name,
      lastRecordDate: habit.lastRecordedAt,
      started: habit.startDate,
    );
  }

  final int id;
  final String name;

  /// Null when nothing has been logged for this habit yet.
  final DateTime? lastRecordDate;
  final DateTime started;
}

import '../domain/habit_definition.dart';
import '../domain/habits_repository.dart';
import '../logger.dart';

class _SeedHabit {
  const _SeedHabit(this.definition, this.lastRecordedAt);

  final NewHabitDefinition definition;
  final DateTime lastRecordedAt;
}

final _seedHabits = [
  _SeedHabit(
    NewHabitDefinition(
      name: 'reading',
      frequencyCount: 1,
      frequencyPeriod: FrequencyPeriod.day,
      startDate: DateTime(2025, 1, 1),
    ),
    DateTime(2026, 4, 1),
  ),
  _SeedHabit(
    NewHabitDefinition(
      name: 'stretching',
      frequencyCount: 1,
      frequencyPeriod: FrequencyPeriod.day,
      startDate: DateTime(2025, 1, 1),
    ),
    DateTime(2026, 3, 29),
  ),
  _SeedHabit(
    NewHabitDefinition(
      name: 'exercising',
      frequencyCount: 3,
      frequencyPeriod: FrequencyPeriod.week,
      startDate: DateTime(2024, 8, 1),
    ),
    DateTime(2026, 4, 11),
  ),
];

/// Fills an empty database with sample habits. Does nothing when any habit
/// already exists, so user data is never overwritten on later startups.
Future<void> seedDatabase(HabitsRepository repository) async {
  final existing = await repository.watchHabits().first;
  if (existing.isNotEmpty) {
    return;
  }

  mainLogger.info('Seeding database with ${_seedHabits.length} sample habits');
  for (final seed in _seedHabits) {
    final habit = await repository.createHabit(seed.definition);
    await repository.addLog(habit.id, at: seed.lastRecordedAt);
  }
}

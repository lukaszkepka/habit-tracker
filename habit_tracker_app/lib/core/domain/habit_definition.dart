/// Unit of the period a habit frequency refers to.
enum FrequencyPeriod { day, week, month }

/// Storage-agnostic habit definition.
class HabitDefinition {
  const HabitDefinition({
    required this.id,
    required this.name,
    required this.description,
    required this.frequencyCount,
    required this.frequencyPeriod,
    required this.startDate,
    this.endDate,
    this.notificationTimeMinutes,
    this.sortOrder = 0,
    this.lastRecordedAt,
  });

  final int id;
  final String name;
  final String description;
  final int frequencyCount;
  final FrequencyPeriod frequencyPeriod;
  final DateTime startDate;
  final DateTime? endDate;

  /// Minutes since midnight; null = no reminder.
  final int? notificationTimeMinutes;
  final int sortOrder;

  /// Time of the most recent log; null when nothing was logged yet.
  final DateTime? lastRecordedAt;
}

/// Data needed to create a habit; the id is assigned by the storage.
class NewHabitDefinition {
  const NewHabitDefinition({
    required this.name,
    required this.frequencyCount,
    required this.frequencyPeriod,
    this.description = '',
    this.startDate,
    this.endDate,
    this.notificationTimeMinutes,
  });

  final String name;
  final String description;
  final int frequencyCount;
  final FrequencyPeriod frequencyPeriod;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? notificationTimeMinutes;
}

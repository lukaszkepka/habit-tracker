/// Storage-agnostic record of a habit activity.
class HabitLog {
  const HabitLog({
    required this.id,
    required this.habitDefinitionId,
    required this.loggedAt,
    this.note,
  });

  final int id;
  final int habitDefinitionId;
  final DateTime loggedAt;
  final String? note;
}

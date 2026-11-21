/// One row in the active habits list (UI-facing model).
class ActiveHabit {
  const ActiveHabit({
    required this.name,
    required this.lastRecordDate,
    required this.started,
  });

  factory ActiveHabit.fromJson(Map<String, dynamic> json) {
    return ActiveHabit(
      name: json['name'] as String,
      lastRecordDate: DateTime.parse(json['last_record_date'] as String),
      started: DateTime.parse(json['started'] as String),
    );
  }

  final String name;
  final DateTime lastRecordDate;
  final DateTime started;
}

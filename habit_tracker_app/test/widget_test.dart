import 'package:drift/native.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:habit_tracker_app/core/database/database_seeder.dart';
import 'package:habit_tracker_app/core/database/drift/app_database.dart';
import 'package:habit_tracker_app/core/database/drift/drift_habits_repository.dart';
import 'package:habit_tracker_app/main.dart';

void main() {
  late AppDatabase db;
  late DriftHabitsRepository repository;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repository = DriftHabitsRepository(db);
  });

  tearDown(() => db.close());

  test('seeding fills an empty database once', () async {
    await seedDatabase(repository);
    await seedDatabase(repository);

    final habits = await repository.watchHabits().first;
    expect(habits.map((h) => h.name), ['reading', 'stretching', 'exercising']);
    expect(habits.first.lastRecordedAt, DateTime(2026, 4, 1));
  });

  testWidgets('shows habits from the drift repository', (tester) async {
    await tester.runAsync(() => seedDatabase(repository));

    await tester.pumpWidget(MyApp(repository: repository));
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 50)));
    await tester.pump();

    expect(find.text('reading'), findsOneWidget);
    expect(find.text('stretching'), findsOneWidget);
    expect(find.text('exercising'), findsOneWidget);
    expect(find.text('Last record: 2026-04-01'), findsOneWidget);

    // Dispose the stream subscription before the database closes.
    await tester.pumpWidget(const SizedBox.shrink());
  });
}

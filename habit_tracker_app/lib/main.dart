import 'package:flutter/material.dart';

import 'core/database/database_seeder.dart';
import 'core/database/drift/app_database.dart';
import 'core/database/drift/drift_habits_repository.dart';
import 'core/logger.dart';
import 'core/domain/habits_repository.dart';
import 'scaffold/app_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeLogging();
  mainLogger.info('App starting');

  final repository = DriftHabitsRepository(AppDatabase());
  await seedDatabase(repository);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.repository});

  final HabitsRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habits',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AppShell(repository: repository),
    );
  }
}

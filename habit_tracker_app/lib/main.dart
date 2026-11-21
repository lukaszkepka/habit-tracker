import 'package:flutter/material.dart';

import 'active_habits/active_habits.dart';
import 'core/logger.dart';

void main() {
  initializeLogging();

  mainLogger.info('App starting');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habits',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ActiveHabitsList(),
    );
  }
}

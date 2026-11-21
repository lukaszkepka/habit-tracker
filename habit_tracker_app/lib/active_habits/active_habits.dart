import 'package:flutter/material.dart';

import '../create_habit/create_habit_page.dart';
import '../core/domain/habit_definition.dart';
import '../core/domain/habits_repository.dart';
import 'active_habit.dart';

String _formatCalendarDate(DateTime d) {
  final y = d.year.toString().padLeft(4, '0');
  final m = d.month.toString().padLeft(2, '0');
  final day = d.day.toString().padLeft(2, '0');
  return '$y-$m-$day';
}

/// Lists active habits: name, last record date, started date.
///
/// Habits are read from (and created in) [repository].
class ActiveHabitsList extends StatefulWidget {
  const ActiveHabitsList({super.key, required this.repository});

  final HabitsRepository repository;

  @override
  State<ActiveHabitsList> createState() => _ActiveHabitsListState();
}

class _ActiveHabitsListState extends State<ActiveHabitsList> {
  late Stream<List<ActiveHabit>> _habits;

  @override
  void initState() {
    super.initState();
    _habits = _watch();
  }

  @override
  void didUpdateWidget(ActiveHabitsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.repository != widget.repository) {
      _habits = _watch();
    }
  }

  Stream<List<ActiveHabit>> _watch() => widget.repository
      .watchHabits()
      .map((habits) => habits.map(ActiveHabit.fromDefinition).toList());

  Future<void> _openCreateHabit() async {
    final created = await Navigator.of(context).push<NewHabitDefinition>(
      MaterialPageRoute<NewHabitDefinition>(
        builder: (context) => const CreateHabitPage(),
      ),
    );
    if (created == null) {
      return;
    }
    await widget.repository.createHabit(created);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Active habits')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StreamBuilder<List<ActiveHabit>>(
              stream: _habits,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Could not load habits: ${snapshot.error}'));
                }
                final habits = snapshot.data;
                if (habits == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (habits.isEmpty) {
                  return const Center(child: Text('No habits yet'));
                }
                return ListView.separated(
              itemCount: habits.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final habit = habits[index];
                return ListTile(
                  title: Text(habit.name, style: theme.textTheme.titleMedium),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        'Last record: ${habit.lastRecordDate == null ? 'never' : _formatCalendarDate(habit.lastRecordDate!)}',
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        'Started: ${_formatCalendarDate(habit.started)}',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  isThreeLine: true,
                );
              },
                );
              },
            ),
          ),
          SafeArea(
            minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: FilledButton.icon(
              onPressed: _openCreateHabit,
              icon: const Icon(Icons.add),
              label: const Text('Add habit'),
            ),
          ),
        ],
      ),
    );
  }
}

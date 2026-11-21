import 'package:flutter/material.dart';

import '../create_habit/create_habit_page.dart';
import 'active_habit.dart';

/// Mock rows in the same shape as API JSON (snake_case keys). Mutable so new
/// habits from [CreateHabitPage] can be appended.
final List<Map<String, String>> mockActiveHabitJson = [
  {
    'name': 'reading',
    'last_record_date': '2026-04-01',
    'started': '2025-01-01',
  },
  {
    'name': 'stretching',
    'last_record_date': '2026-03-29',
    'started': '2025-01-01',
  },
  {
    'name': 'exercising',
    'last_record_date': '2026-04-11',
    'started': '2024-08-01',
  },
];

String _formatCalendarDate(DateTime d) {
  final y = d.year.toString().padLeft(4, '0');
  final m = d.month.toString().padLeft(2, '0');
  final day = d.day.toString().padLeft(2, '0');
  return '$y-$m-$day';
}

/// Lists active habits: name, last record date, started date.
///
/// When [habitsOverride] is set, that list is shown and the FAB does not
/// mutate [mockActiveHabitJson].
class ActiveHabitsList extends StatefulWidget {
  const ActiveHabitsList({super.key, this.habitsOverride});

  final List<ActiveHabit>? habitsOverride;

  @override
  State<ActiveHabitsList> createState() => _ActiveHabitsListState();
}

class _ActiveHabitsListState extends State<ActiveHabitsList> {
  List<ActiveHabit> get _habits {
    if (widget.habitsOverride != null) {
      return widget.habitsOverride!;
    }
    return mockActiveHabitJson.map(ActiveHabit.fromJson).toList();
  }

  Future<void> _openCreateHabit() async {
    if (widget.habitsOverride != null) {
      return;
    }
    final created = await Navigator.of(context).push<Map<String, String>>(
      MaterialPageRoute<Map<String, String>>(
        builder: (context) => const CreateHabitPage(),
      ),
    );
    if (!mounted || created == null) {
      return;
    }
    setState(() {
      mockActiveHabitJson.add(created);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final habits = _habits;

    return Scaffold(
      appBar: AppBar(title: const Text('Active habits')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.separated(
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
                        'Last record: ${_formatCalendarDate(habit.lastRecordDate)}',
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
            ),
          ),
          SafeArea(
            minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: FilledButton.icon(
              onPressed: widget.habitsOverride != null ? null : _openCreateHabit,
              icon: const Icon(Icons.add),
              label: const Text('Add habit'),
            ),
          ),
        ],
      ),
    );
  }
}

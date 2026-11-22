import 'package:flutter/material.dart';

import '../active_habits/active_habits.dart';
import '../core/domain/habits_repository.dart';
import 'placeholder_screen.dart';

/// One destination reachable from the bottom menu.
class _Destination {
  const _Destination({
    required this.title,
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.builder,
  });

  /// Shown in the top menu while this destination is active.
  final String title;

  /// Shown under the icon in the bottom menu.
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final WidgetBuilder builder;
}

/// Durable UI scaffold (see docs/todos/ui_scaffold.md): a top menu with the
/// current screen name and a settings button, and a bottom menu switching
/// between the main screens.
class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.repository});

  final HabitsRepository repository;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  late final List<_Destination> _destinations = [
    _Destination(
      title: 'Habits',
      label: 'Habits',
      icon: Icons.checklist_outlined,
      selectedIcon: Icons.checklist,
      builder: (context) => ActiveHabitsList(repository: widget.repository),
    ),
    _Destination(
      title: 'Record',
      label: 'Record',
      icon: Icons.add_task_outlined,
      selectedIcon: Icons.add_task,
      builder: (context) => const PlaceholderScreen(
        icon: Icons.add_task,
        message: 'Logging a new activity is coming soon.',
      ),
    ),
    _Destination(
      title: 'History',
      label: 'History',
      icon: Icons.history_outlined,
      selectedIcon: Icons.history,
      builder: (context) => const PlaceholderScreen(
        icon: Icons.history,
        message: 'Activity history is coming soon.',
      ),
    ),
  ];

  void _openSettings() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Settings'), centerTitle: false),
          body: const PlaceholderScreen(
            icon: Icons.settings,
            message: 'Settings are coming soon.',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final current = _destinations[_selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(current.title),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: _openSettings,
          ),
        ],
      ),
      // IndexedStack keeps each screen's state (scroll position, streams)
      // alive while switching tabs.
      body: IndexedStack(
        index: _selectedIndex,
        children: [for (final d in _destinations) Builder(builder: d.builder)],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        destinations: [
          for (final d in _destinations)
            NavigationDestination(
              icon: Icon(d.icon),
              selectedIcon: Icon(d.selectedIcon),
              label: d.label,
            ),
        ],
      ),
    );
  }
}

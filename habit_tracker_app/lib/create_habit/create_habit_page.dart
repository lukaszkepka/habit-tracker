import 'package:flutter/material.dart';

String _formatCalendarDate(DateTime d) {
  final y = d.year.toString().padLeft(4, '0');
  final m = d.month.toString().padLeft(2, '0');
  final day = d.day.toString().padLeft(2, '0');
  return '$y-$m-$day';
}

String _formatNotificationTime(TimeOfDay t) {
  final h = t.hour.toString().padLeft(2, '0');
  final m = t.minute.toString().padLeft(2, '0');
  return '$h:$m';
}

/// Create-habit form aligned with [docs/project.md]: name, description, frequency
/// (N times per day/week/month), end date, notification time. Pops with a
/// `Map<String, String>` in mock API shape when creation is confirmed.
class CreateHabitPage extends StatefulWidget {
  const CreateHabitPage({super.key});

  @override
  State<CreateHabitPage> createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _frequencyCountController = TextEditingController(text: '1');

  String _frequencyUnit = 'day';
  late DateTime _endDate;
  late TimeOfDay _notificationTime;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _endDate = DateTime(
      now.year,
      now.month,
      now.day,
    ).add(const Duration(days: 30));
    _notificationTime = const TimeOfDay(hour: 9, minute: 0);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _frequencyCountController.dispose();
    super.dispose();
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 20)),
    );
    if (picked != null) {
      setState(() => _endDate = picked);
    }
  }

  Future<void> _pickNotificationTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _notificationTime,
    );
    if (picked != null) {
      setState(() => _notificationTime = picked);
    }
  }

  Map<String, String> _buildResultMap() {
    final today = DateTime.now();
    final calendarToday = DateTime(today.year, today.month, today.day);
    return {
      'name': _nameController.text.trim(),
      'description': _descriptionController.text.trim(),
      'last_record_date': _formatCalendarDate(calendarToday),
      'started': _formatCalendarDate(calendarToday),
      'frequency_n': _frequencyCountController.text.trim(),
      'frequency_unit': _frequencyUnit,
      'end_date': _endDate.toIso8601String(),
      'notification_time': _notificationTime.toString(),
    };
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create habit'),
          content: Text(
            'Save “${_nameController.text.trim()}” and add it to your active habits?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Create'),
            ),
          ],
        );
      },
    );

    if (confirmed == true && mounted) {
      Navigator.of(context).pop<Map<String, String>>(_buildResultMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('New habit')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Enter a name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 8),
            Text('Frequency', style: theme.textTheme.titleSmall),
            const SizedBox(height: 4),
            Text(
              'How often activities should be logged for this habit to count as successful in each period.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _frequencyCountController,
              decoration: const InputDecoration(
                labelText: 'Times (N)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Required';
                }
                final n = int.tryParse(value.trim());
                if (n == null || n < 1) {
                  return 'Enter a whole number ≥ 1';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Per',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'day', label: Text('Day')),
                    ButtonSegment(value: 'week', label: Text('Week')),
                  ],
                  selected: {_frequencyUnit},
                  onSelectionChanged: (selection) {
                    setState(() => _frequencyUnit = selection.first);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('End date'),
              subtitle: Text(_formatCalendarDate(_endDate)),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickEndDate,
            ),
            const SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Notification to record activity'),
              subtitle: Text(_formatNotificationTime(_notificationTime)),
              trailing: const Icon(Icons.schedule),
              onTap: _pickNotificationTime,
            ),
            const SizedBox(height: 24),
            FilledButton(onPressed: _submit, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/tasks/domain/task.dart';
import 'package:todo_app/features/tasks/domain/task_provider.dart';

class TaskCheckbox extends ConsumerStatefulWidget {
  final Task task;

  const TaskCheckbox({super.key, required this.task});

  @override
  ConsumerState<TaskCheckbox> createState() {
    return _TaskCheckboxState();
  }
}

class _TaskCheckboxState extends ConsumerState<TaskCheckbox> {
  void _toggleTask() {
    ref
        .read(taskProvider.notifier)
        .updateTask(
          widget.task.copyWith(
            isDone: !widget.task.isDone,
            updatedAt: DateTime.now(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: widget.task.isDone, onChanged: (_) => _toggleTask());
  }
}

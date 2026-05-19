import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/tasks/domain/task.dart';
import 'package:todo_app/features/tasks/presentation/widgets/task_checkbox.dart';

class TaskItem extends ConsumerWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: task.description == null
          ? null
          : Text(
              task.description ?? '',
              style: TextStyle(
                fontStyle: task.isDone ? FontStyle.italic : null,
                fontSize: 12,
              ),
            ),
      leading: TaskCheckbox(task: task),
    );
  }
}

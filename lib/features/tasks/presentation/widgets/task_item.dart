import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/tasks/domain/task.dart';
import 'package:todo_app/features/tasks/domain/task_provider.dart';
import 'package:todo_app/features/tasks/presentation/widgets/task_checkbox.dart';

class TaskItem extends ConsumerWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  void _onDelete(WidgetRef ref) {
    ref.read(taskProvider.notifier).deleteTask(task.id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(task.id),
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        padding: EdgeInsets.only(right: 16),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => _onDelete(ref),
      child: ListTile(
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
      ),
    );
  }
}

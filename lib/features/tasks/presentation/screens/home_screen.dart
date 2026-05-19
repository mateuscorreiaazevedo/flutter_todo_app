import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/tasks/domain/task_provider.dart';
import 'package:todo_app/features/tasks/presentation/widgets/add_task_sheet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksService = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Tarefas'), centerTitle: true),
      body: tasksService.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Erro: $error')),
        data: (tasks) => tasks.isEmpty
            ? const Center(child: Text('Nenhuma tarefa cadastrada.'))
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.description ?? ''),
                    leading: Checkbox(value: task.isDone, onChanged: (_) {}),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const AddTaskSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

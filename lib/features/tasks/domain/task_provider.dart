import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/tasks/data/local_task_repository.dart';
import 'package:todo_app/features/tasks/domain/task.dart';
import 'package:todo_app/features/tasks/domain/task_repository.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  ref.keepAlive();
  return LocalTaskRepository();
});

// Método mais verboso: instancia do ref a cada método
// class TaskNotifier extends AsyncNotifier<List<Task>> {

//   @override
//   FutureOr<List<Task>> build() async {
//     final repository = ref.read(taskRepositoryProvider);
//     return repository.list();
//   }

//   Future<void> add(Task task) async {
//     final repository = ref.read(taskRepositoryProvider);
//     await repository.create(task);
//     ref.invalidateSelf();
//   }

//   Future<void> updateTask(Task task) async {
//     final repository = ref.read(taskRepositoryProvider);
//     await repository.update(task);
//     ref.invalidateSelf();
//   }

//   Future<void> delete(String id) async {
//     final repository = ref.read(taskRepositoryProvider);
//     await repository.delete(id);
//     ref.invalidateSelf();
//   }
// }

class TaskNotifier extends AsyncNotifier<List<Task>> {
  late TaskRepository _repository;

  @override
  FutureOr<List<Task>> build() async {
    _repository = ref.read(taskRepositoryProvider);
    return _repository.list();
  }

  Future<void> createTask(Task task) async {
    await _repository.create(task);
    ref.invalidateSelf();
  }

  Future<void> updateTask(Task task) async {
    await _repository.update(task);
    ref.invalidateSelf();
  }

  Future<void> deleteTask(String id) async {
    await _repository.delete(id);
    ref.invalidateSelf();
  }
}

final taskProvider = AsyncNotifierProvider<TaskNotifier, List<Task>>(() {
  return TaskNotifier();
});

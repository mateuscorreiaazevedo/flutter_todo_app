import '../domain/task.dart';
import '../domain/task_repository.dart';

class LocalTaskRepository implements TaskRepository {
  final List<Task> _tasks = [];

  @override
  Future<List<Task>> list() async {
    return _tasks;
  }

  @override
  Future<void> create(Task task) async {
    _tasks.add(task);
  }

  @override
  Future<void> delete(String id) async {
    _tasks.removeWhere((t) => t.id == id);
  }

  @override
  Future<void> update(Task task) async {
    final findedIndex = _tasks.indexWhere((t) => t.id == task.id);

    if (findedIndex != -1) {
      _tasks[findedIndex] = task;
    }
  }
}

import 'task.dart';

abstract class TaskRepository {
  Future<List<Task>> list();
  Future<void> create(Task task);
  Future<void> update(Task task);
  Future<void> delete(String id);
}

import 'package:taski_to_do/app/interface/task_interface.dart';
import 'package:taski_to_do/app/models/task_model.dart';

class TaskRepository implements ITaskRepository {
  final List<TaskModel> _tasks = [];

  @override
  List<TaskModel> get tasks => List.unmodifiable(_tasks);

  @override
  List<TaskModel> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  @override
  List<TaskModel> get pendingTasks =>
      _tasks.where((task) => !task.isCompleted).toList();

  @override
  void toggleTaskCompletion(int index) {
    if (index >= 0 && index < _tasks.length) {
      final task = _tasks[index];
      _tasks[index] = TaskModel(
        title: task.title,
        description: task.description,
        isCompleted: !task.isCompleted,
      );
    }
  }

  @override
  void deleteTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
    }
  }

  @override
  void deleteAll() {
    _tasks.clear();
  }

  @override
  void addTask(String title, String description) {
    if (title.isNotEmpty) {
      final task = TaskModel(
        title: title,
        description: description,
        isCompleted: false,
      );
      _tasks.add(task);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:taski_to_do/app/models/task_model.dart';

class WelcomeViewModel extends ChangeNotifier {
  final List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => List.unmodifiable(_tasks);

  List<TaskModel> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  List<TaskModel> get pendingTasks =>
      _tasks.where((task) => !task.isCompleted).toList();

  void toggleTaskCompletion(int index) {
    if (index >= 0 && index < _tasks.length) {
      final task = _tasks[index];
      _tasks[index] = TaskModel(
        title: task.title,
        description: task.description,
        isCompleted: !task.isCompleted,
      );
      notifyListeners();
    }
  }
}

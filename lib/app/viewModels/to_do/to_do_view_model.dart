import 'package:flutter/material.dart';
import 'package:taski_to_do/app/models/task_model.dart';
import 'package:taski_to_do/app/repository/task_repository.dart';

class ToDoViewModel extends ChangeNotifier {
  ToDoViewModel(this._taskRepository);

  final TaskRepository _taskRepository;

  List<TaskModel> get tasks => _taskRepository.tasks;

  List<TaskModel> get completedTasks => _taskRepository.completedTasks;

  List<TaskModel> get pendingTasks => _taskRepository.pendingTasks;

  void toggleTaskCompletion(int index) {
    _taskRepository.toggleTaskCompletion(index);
    notifyListeners();
  }
}

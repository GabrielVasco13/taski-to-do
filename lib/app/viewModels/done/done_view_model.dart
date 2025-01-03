import 'package:flutter/widgets.dart';
import 'package:taski_to_do/app/models/task_model.dart';
import 'package:taski_to_do/app/repository/task_repository.dart';

class DoneViewModel extends ChangeNotifier {
  DoneViewModel(this._taskRepository);

  final TaskRepository _taskRepository;

  List<TaskModel> get completedTasks => _taskRepository.completedTasks;

  void deleteTask(int index) {
    _taskRepository.deleteTask(index);
    notifyListeners();
  }

  void deleteAll() {
    _taskRepository.deleteAll();
    notifyListeners();
  }
}

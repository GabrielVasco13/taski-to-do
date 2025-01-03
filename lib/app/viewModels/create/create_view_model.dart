import 'package:flutter/widgets.dart';
import 'package:taski_to_do/app/repository/task_repository.dart';

class CreateViewModel extends ChangeNotifier {
  CreateViewModel(this._taskRepository);

  final TaskRepository _taskRepository;

  void addTask(String title, String description) {
    _taskRepository.addTask(title, description);
    notifyListeners();
  }
}

import 'package:flutter/widgets.dart';
import 'package:taski_to_do/app/interface/task_interface.dart';
import 'package:taski_to_do/app/models/task_model.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel(this._repository);

  final ITaskRepository _repository;
  List<TaskModel> _filteredTasks = [];
  List<TaskModel> get filteredTasks => _filteredTasks;

  void searchTasks(String query) {
    if (query.isEmpty) {
      _filteredTasks = [];
    } else {
      final tasks = _repository.getTasks();
      _filteredTasks = tasks
          .where((task) =>
              task.title.toLowerCase().contains(query.toLowerCase()) ||
              task.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _filteredTasks = [];
    notifyListeners();
  }
}

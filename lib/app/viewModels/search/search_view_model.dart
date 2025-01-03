import 'package:flutter/widgets.dart';
import 'package:taski_to_do/app/models/task_model.dart';
import 'package:taski_to_do/app/repository/task_repository.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel(this._taskRepository);

  final TaskRepository _taskRepository;
  String _search = '';
  List<TaskModel> _searchResults = [];

  String get searchQuery => _search;
  List<TaskModel> get searchResults => _searchResults;

  void search(String result) {
    _search = result;
    if (result.isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = _taskRepository.tasks
          .where((task) =>
              task.title.toLowerCase().contains(result.toLowerCase()) ||
              task.description.toLowerCase().contains(result.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _search = '';
    _searchResults = [];
    notifyListeners();
  }
}

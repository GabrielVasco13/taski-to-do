import 'package:taski_to_do/app/models/task_model.dart';

abstract class ITaskRepository {
  List<TaskModel> get tasks;
  List<TaskModel> get completedTasks;
  List<TaskModel> get pendingTasks;
  List<TaskModel> getTasks();
  void toggleTaskCompletion(int index);
  void deleteTask(int index);
  void deleteAll();
  void addTask(String title, String description);
}

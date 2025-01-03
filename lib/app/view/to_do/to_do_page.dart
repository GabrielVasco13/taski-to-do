import 'package:flutter/material.dart';
import 'package:taski_to_do/app/repository/task_repository.dart';
import 'package:taski_to_do/app/view/widgets/app_bar_widget.dart';
import 'package:taski_to_do/app/view/widgets/bottom_navigation_widget.dart';
import 'package:taski_to_do/app/viewModels/to_do/to_do_view_model.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  late final ToDoViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ToDoViewModel(TaskRepository());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: const AppBarWidget(),
          bottomNavigationBar: const BottomNavigationWidget(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 24),
                child: Row(
                  children: [
                    const Text(
                      'Welcome, ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'John',
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Row(
                  children: [
                    Text(
                      /// atualizar a quantidade de tasks para fazer
                      "You've got ${_viewModel.pendingTasks.length} tasks to do",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _viewModel.pendingTasks.length,
                  itemBuilder: (context, index) {
                    final task = _viewModel.pendingTasks[index];
                    return ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.description),
                      trailing: Checkbox(
                        value: task.isCompleted,
                        onChanged: (_) =>
                            _viewModel.toggleTaskCompletion(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

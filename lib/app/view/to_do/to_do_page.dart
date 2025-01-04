import 'package:flutter/material.dart';
import 'package:taski_to_do/app/repository/task_repository.dart';
import 'package:taski_to_do/app/view/widgets/app_bar_widget.dart';
import 'package:taski_to_do/app/view/widgets/bottom_navigation_widget.dart';
import 'package:taski_to_do/app/view/widgets/title_message_widget.dart';
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
              TitleMessageWidget(
                text: "You've got ${_viewModel.pendingTasks.length} tasks",
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

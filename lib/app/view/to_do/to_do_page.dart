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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _viewModel.pendingTasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/no-result.png'),
                        const SizedBox(height: 16),
                        const Text(
                          'You have no task listed.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    itemCount: _viewModel.pendingTasks.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final task = _viewModel.pendingTasks[index];
                      return Card(
                        child: ListTile(
                          title: Text(task.title),
                          subtitle: Text(task.description),
                          trailing: Checkbox(
                            value: task.isCompleted,
                            onChanged: (_) =>
                                _viewModel.toggleTaskCompletion(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}

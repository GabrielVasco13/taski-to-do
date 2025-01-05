import 'package:flutter/material.dart';
import 'package:taski_to_do/app/repository/task_repository.dart';
import 'package:taski_to_do/app/view/widgets/app_bar_widget.dart';
import 'package:taski_to_do/app/view/widgets/bottom_navigation_widget.dart';
import 'package:taski_to_do/app/viewModels/done/done_view_model.dart';

class DonePage extends StatefulWidget {
  const DonePage({super.key});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  late DoneViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = DoneViewModel(TaskRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      bottomNavigationBar: const BottomNavigationWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 4,
            ),
            child: Row(
              children: [
                const Text(
                  'Completed Tasks',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Delete all',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: viewModel.completedTasks.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/no-result.png'),
                      const SizedBox(height: 8),
                      const Text('No completed tasks yet')
                    ],
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: viewModel.completedTasks.length,
                    itemBuilder: (context, index) {
                      final task = viewModel.completedTasks[index];
                      return Card(
                        child: ListTile(
                          title: Text(
                            task.title,
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          subtitle: Text(task.description),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                viewModel.deleteTask(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

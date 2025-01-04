import 'package:flutter/material.dart';
import 'package:taski_to_do/app/repository/task_repository.dart';
import 'package:taski_to_do/app/view/widgets/app_bar_widget.dart';
import 'package:taski_to_do/app/view/widgets/bottom_navigation_widget.dart';
import 'package:taski_to_do/app/view/widgets/title_message_widget.dart';
import 'package:taski_to_do/app/viewModels/create/create_view_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late final CreateViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CreateViewModel(TaskRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      bottomNavigationBar: const BottomNavigationWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleMessageWidget(
              text: 'Create tasks to achieve more.',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        final titleController = TextEditingController();
                        final descriptionController = TextEditingController();

                        showModalBottomSheet(
                          context: context,
                          scrollControlDisabledMaxHeightRatio: 0.5,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: titleController,
                                    decoration: const InputDecoration(
                                      hintText: 'Title',
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextField(
                                    controller: descriptionController,
                                    decoration: const InputDecoration(
                                      hintText: 'Description',
                                    ),
                                  ),
                                  const SizedBox(height: 32.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      final title = titleController.text;
                                      final description =
                                          descriptionController.text;

                                      if (title.isNotEmpty) {
                                        _viewModel.addTask(title, description);
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Create Task'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('Create Task'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

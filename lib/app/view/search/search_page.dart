import 'package:flutter/material.dart';
import 'package:taski_to_do/app/repository/task_repository.dart';
import 'package:taski_to_do/app/view/widgets/app_bar_widget.dart';
import 'package:taski_to_do/app/view/widgets/bottom_navigation_widget.dart';
import 'package:taski_to_do/app/viewModels/search/search_view_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchViewModel viewModel;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = SearchViewModel(TaskRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      bottomNavigationBar: const BottomNavigationWidget(),
      body: Column(
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              onChanged: (value) => {
                setState(() {
                  viewModel.searchTasks(value);
                })
              },
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for your tasks!',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      viewModel.clearSearch();
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 3),
                ),
              ),
            ),
          ),
          Expanded(
            child: viewModel.filteredTasks.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/no-result.png'),
                      const SizedBox(height: 8),
                      const Text('No tasks found')
                    ],
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: viewModel.filteredTasks.length,
                    itemBuilder: (context, index) {
                      final task = viewModel.filteredTasks[index];
                      return Card(
                        child: ListTile(
                          title: Text(task.title),
                          subtitle: Text(task.description),
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

import 'package:flutter/material.dart';
import 'package:taski_to_do/app/view/widgets/app_bar_widget.dart';
import 'package:taski_to_do/app/view/widgets/bottom_navigation_widget.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Padding(
            padding: EdgeInsets.only(left: 32),
            child: Row(
              children: [
                Text(
                  /// atualizar a quantidade de tasks para fazer
                  "You've got 7 tasks to do",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taski_to_do/app/view/widgets/bottom_navigation.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Taski',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

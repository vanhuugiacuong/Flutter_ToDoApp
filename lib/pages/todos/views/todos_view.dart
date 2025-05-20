import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodosView extends StatelessWidget {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TodosView'.tr), // Localized title
      ),
      body: Center(
        child: Text('Add Task'.tr), // Localized text
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add task
        },
        child: const Icon(Icons.add),
        tooltip: 'Add Task'.tr, // Localized tooltip
      ),
    );
  }
}

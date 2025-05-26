import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({super.key});

  static List<Color> cardColors = [
    const Color(0xFFFFF9C4), // Vàng nhạt
    const Color(0xFFFFE0E6), // Hồng nhạt
    const Color(0xFFB3E5FC), // Xanh nhạt
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fabBorderColor = isDark ? Colors.white : Colors.black;
    final fabIconColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(title: Text('TodosView'.tr), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.todoData.length,
            itemBuilder: (context, index) {
              final todo = controller.todoData[index];
              final color = cardColors[index % cardColors.length];
              final borderColor = isDark ? Colors.white : Colors.black;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: borderColor,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todo['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            todo['description'] ?? 'No description available',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          if (todo['reactive'] != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: Colors.black54,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    todo['reactive'].toString().substring(0, 8),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        shape: const CircleBorder(),
                        value: todo['is_done'] ?? false,
                        onChanged: (value) {
                          controller.doneTask(todo['id'], value!);
                        },
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.black,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: const VisualDensity(
                          horizontal: -2,
                          vertical: -2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      color: Colors.black,
                      onPressed: () {
                        _showEditDialog(context, controller, todo, isDark);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.black,
                      onPressed: () {
                        controller.deleteTask(todo['id']);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: fabBorderColor, width: 2),
          color: const Color(0xFFB9F6CA),
        ),
        child: RawMaterialButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          elevation: 6,
          onPressed: () {
            _showAddDialog(context, controller, isDark);
          },
          child: Icon(Icons.add, size: 36, color: fabIconColor),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showAddDialog(BuildContext context, TodoController controller, bool isDark) {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    final color = TodoView.cardColors[DateTime.now().millisecondsSinceEpoch % TodoView.cardColors.length];
    final borderColor = isDark ? Colors.white : Colors.black;

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task'.tr,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descController,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
                decoration: InputDecoration(
                  labelText: 'Description'.tr,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      controller.addTask(
                        nameController.text,
                        descController.text,
                      );
                      Get.back();
                    },
                    child: Text('Add'.tr),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, TodoController controller, dynamic todo, bool isDark) {
    final nameController = TextEditingController(text: todo['name']);
    final descController = TextEditingController(text: todo['description']);
    final color = TodoView.cardColors[todo['id'] % TodoView.cardColors.length];
    final borderColor = isDark ? Colors.white : Colors.black;

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Task'.tr,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
                decoration: InputDecoration(
                  labelText: 'Title'.tr,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descController,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
                decoration: InputDecoration(
                  labelText: 'Description'.tr,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      controller.editTask(
                        todo['id'],
                        nameController.text,
                        descController.text,
                      );
                      Get.back();
                    },
                    child: Text('Save'.tr),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';

class TodoController extends GetxController {
  //TODO: Implement TodoController

  final count = 0.obs;

  final isLoading = false.obs;
  late final todoData = [].obs;

  @override
  void onInit() async {
    super.onInit();
    await getTodo();
  }

  Future<void> getTodo() async {
    isLoading.value = true;
    try {
      todoData.value = await Supabase.instance.client
          .from('todos')
          .select()
          .order('id', ascending: true);
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching todos");
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addTask(String name, String? description) async {
    try {
      await Supabase.instance.client.from('todos').insert({
        'name': name,
        'description': description,
        'is_done': false,
      });
      await getTodo();
      Get.snackbar('Success', 'Task added');
    } catch (e) {
      Get.snackbar('Error', 'Add task failed');
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await Supabase.instance.client.from('todos').delete().eq('id', id);
      todoData.removeWhere((item) => item['id'] == id);
      Get.snackbar('Success', 'Task deleted');
    } catch (e) {
      Get.snackbar('Error', 'Delete task failed');
    }
  }

  Future<void> editTask(int id, String name, String? description) async {
    try {
      await Supabase.instance.client
          .from('todos')
          .update({'name': name, 'description': description})
          .eq('id', id);
      await getTodo();
      Get.snackbar('Success', 'Task updated');
    } catch (e) {
      Get.snackbar('Error', 'Update task failed');
    }
  }

  // Future<void> doneTask(int id, bool value) async {
  //   try {
  //     await Supabase.instance.client
  //         .from('todos')
  //         .update({'is_done': value})
  //         .eq('id', id);
  //     final index = todoData.indexWhere((item) => item['id'] == id);
  //     if (index != -1) {
  //       todoData[index] = {...todoData[index], 'is_done': value};
  //       todoData.refresh();
  //     }
  //     Get.snackbar('Success', "Update todo success");
  //   } catch (e) {
  //     Get.snackbar('Error', 'Update todo failed');
  //   }
  // }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

import 'package:fluttertodosappsupabase/pages/todo/controllers/todo_controller.dart';
import 'package:get/get.dart';

import '../controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(() => LayoutController());

    Get.lazyPut(() => TodoController());
  }
}

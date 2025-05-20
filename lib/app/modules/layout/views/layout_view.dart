import 'package:flutter/material.dart';
import 'package:fluttertodosappsupabase/pages/home/views/home_view.dart';
import 'package:fluttertodosappsupabase/pages/setting/views/setting_view.dart';
import 'package:fluttertodosappsupabase/pages/todo/views/todo_view.dart';

import 'package:get/get.dart';

import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  static const List<Widget> _pages = [TodoView(), HomeView(), SettingView()];

  const LayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _pages[controller.currentIndex.value],
            transitionBuilder:
                (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.onTabTapped,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.list),
                label: 'TodosView'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'Home'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: 'Settings'.tr,
              ),
            ],
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'.tr), // Localized title
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to the app!'.tr, // Localized text
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

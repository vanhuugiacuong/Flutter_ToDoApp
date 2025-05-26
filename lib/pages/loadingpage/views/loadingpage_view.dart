import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loadingpage_controller.dart';

class LoadingpageView extends GetView<LoadingpageController> {
  const LoadingpageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/loadingpage_controller.dart';

class LoadingpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadingpageController>(
      () => LoadingpageController(),
    );
  }
}

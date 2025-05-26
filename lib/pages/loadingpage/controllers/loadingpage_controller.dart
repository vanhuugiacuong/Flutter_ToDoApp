import 'package:get/get.dart';

class LoadingpageController extends GetxController {
  //TODO: Implement LoadingpageController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed('/auth');
      Get.offAllNamed('/layout'); // Chuyển hướng đến trang đăng nhập sau 2 giây
    });
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

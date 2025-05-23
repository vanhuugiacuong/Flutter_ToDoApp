import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../signup/controllers/signup_controller.dart';

class LoginController extends GetxController {
  final count = 0.obs;

  Future<bool> signIn(String email, String password) async {
    final signupController = Get.find<SignupController>();
    if (signupController.validateCredentials(email, password)) {
      return true;
    } else {
      Get.snackbar('Error', 'Sai email hoặc mật khẩu');
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
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

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../signup/controllers/signup_controller.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  Future<bool> signIn(String username, String password) async {
    final data =
        await Supabase.instance.client
            .from('profiles')
            .select()
            .eq('username', username)
            .eq('password', password);
    if (data != null) {
      print(data);
      return true;
    } else {
      Get.snackbar('Lỗi', 'Sai username hoặc mật khẩu');
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

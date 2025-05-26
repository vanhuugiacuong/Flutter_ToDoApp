import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupController extends GetxController {
  final count = 0.obs;

  // Local storage for user accounts

  Future<String?> signUp(String username, String password) async {
    try {
      await Supabase.instance.client
          .from('profiles')
          .insert({'username': username, 'password': password});
      return null; // Thành công
    } catch (e) {
      return e.toString();
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

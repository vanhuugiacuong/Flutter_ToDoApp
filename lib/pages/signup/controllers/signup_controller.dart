import 'package:get/get.dart';

class SignupController extends GetxController {
  final count = 0.obs;

  // Local storage for user accounts
  final Map<String, String> _userAccounts = {};

  Future<String?> signUp(String username, String password) async {
    if (_userAccounts.containsKey(username)) {
      return 'Tài khoản đã tồn tại';
    }
    _userAccounts[username] = password;
    return null; // Thành công
  }

  bool validateCredentials(String username, String password) {
    return _userAccounts[username] == password;
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

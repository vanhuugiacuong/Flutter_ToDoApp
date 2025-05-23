import 'package:flutter/material.dart';
import 'package:fluttertodosappsupabase/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  Get.snackbar('Lỗi', 'Email và mật khẩu không được để trống');
                  return;
                }

                final success = await controller.signIn(email, password);
                if (success) {
                 Get.offAllNamed(Routes.LAYOUT); // Ensure '/home' is correctly defined in AppPages
                } else {
                  // Error messages are already handled in the controller
                  print('Login failed');
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/signup'),
              child: Text('Chưa có tài khoản? Đăng ký'),
            ),
          ],
        ),
      ),
    );
  }
}

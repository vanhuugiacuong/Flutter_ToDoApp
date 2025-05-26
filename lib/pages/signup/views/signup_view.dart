import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final username = usernameController.text.trim();
                final password = passwordController.text.trim();

                if (username.isEmpty || password.isEmpty) {
                  Get.snackbar(
                    'Lỗi',
                    'Username và mật khẩu không được để trống',
                  );
                  return;
                }

                final error = await controller.signUp(username, password);
                if (error == null) {
                  Get.snackbar('Thành công', 'Đăng ký thành công');
                  Get.offAllNamed('/login');
                } else {
                  Get.snackbar('Lỗi', error);
                  print('Sign up failed: $error');
                }
              },
              child: Text('Sign Up'),
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Đã có tài khoản? Đăng nhập'),
            ),
          ],
        ),
      ),
    );
  }
}

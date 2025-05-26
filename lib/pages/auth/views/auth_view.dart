import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập với Google'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.login),
          label: Text('Đăng nhập Google'),
          onPressed: () async {
            // await controller.LoginWithGoogle();
            if (kIsWeb) {
              await controller.loginWithGoogleWeb();
            } else {
              await controller.LoginWithGoogle();
            }
          },
        ),
      ),
    );
  }
}

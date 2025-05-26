import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthController extends GetxController {
  //TODO: Implement AuthController

  final count = 0.obs;

  Future<void> loginWithGoogleWeb() async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        // redirectTo: 'http://localhost:3000', // Nếu cần custom redirect
      );
      // Sau khi đăng nhập, Supabase sẽ tự redirect lại app.
      // Bạn nên kiểm tra trạng thái đăng nhập ở splash hoặc init để điều hướng.
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
    }
  }

  Future<void> LoginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId:
            "843103345943-qv4883cqnnr3aasaa7manv2d6jjf9ghp.apps.googleusercontent.com",
        serverClientId:
            "843103345943-dvmu8p4paj0m41ovlms72vupho4irkrc.apps.googleusercontent.com",
      );
      final googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        Get.snackbar('Lỗi', 'Đăng nhập Google thất bại');
        return;
      }
      final googleAuthentication = await googleSignInAccount.authentication;
      final accessToken = googleAuthentication.accessToken;
      final idToken = googleAuthentication.idToken;

      if (accessToken != null && idToken != null) {
        final supabase = Supabase.instance.client;
        final response = await supabase.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken,
        );
        if (response.user != null) {
          Get.snackbar('Thành công', 'Đăng nhập Google thành công');
          Get.offAllNamed('/layout'); // hoặc route bạn muốn
        } else {
          Get.snackbar('Lỗi', 'Đăng nhập Google với Supabase thất bại');
        }
      } else {
        Get.snackbar('Lỗi', 'Không lấy được token từ Google');
      }
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
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

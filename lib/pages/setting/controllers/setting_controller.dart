import 'dart:ui';

import 'package:get/get.dart';

class SettingController extends GetxController {
  //TODO: Implement SettingController
  final locales = [
    {'name': 'English', 'locale': const Locale('en', 'US')},
    {'name': 'Tiếng Việt', 'locale': const Locale('vi', 'VN')},
  ];

  final count = 0.obs;

  void changeLanguage(Locale locale) {
    Get.updateLocale(locale);
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

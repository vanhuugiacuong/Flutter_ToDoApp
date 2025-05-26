import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  //TODO: Implement SettingController
  final locales = [
    {'name': 'English', 'locale': const Locale('en', 'US')},
    {'name': 'Tiếng Việt', 'locale': const Locale('vi', 'VN')},
  ];

  final count = 0.obs;
  final currentLocale = Rx<Locale>(Get.locale ?? const Locale('en', 'US'));
  var isDarkMode = false.obs;

  void changeLanguage(Locale locale) {
    Get.updateLocale(locale);
    currentLocale.value = locale;
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
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

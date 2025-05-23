import 'package:get/get.dart';

import '../../pages/home/bindings/home_binding.dart';
import '../../pages/home/views/home_view.dart';
import '../../pages/login/bindings/login_binding.dart';
import '../../pages/login/views/login_view.dart';
import '../../pages/setting/bindings/setting_binding.dart';
import '../../pages/setting/views/setting_view.dart';
import '../../pages/signup/bindings/signup_binding.dart';
import '../../pages/signup/views/signup_view.dart';
import '../../pages/todo/bindings/todo_binding.dart';
import '../../pages/todo/views/todo_view.dart';
import '../modules/layout/bindings/layout_binding.dart';
import '../modules/layout/views/layout_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.LAYOUT;
  static const INITIAL = _Paths.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TODO,
      page: () => const TodoView(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.LAYOUT,
      page: () => const LayoutView(),
      binding: LayoutBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeView(), // Replace with your layout or todo page widget
      binding: HomeBinding(), // Ensure the correct binding is used
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController controller = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(title: Text('Settings'.tr),
      centerTitle: true,),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('Language'.tr),
            onTap: () {
              Get.defaultDialog(
                title: 'Select Language'.tr,
                content: Column(
                  children: [
                    ListTile(
                      title: const Text('English'),
                      onTap: () {
                        controller.changeLanguage(const Locale('en', 'US'));
                        Get.back();
                      },
                    ),
                    ListTile(
                      title: const Text('Tiếng Việt'),
                      onTap: () {
                        controller.changeLanguage(const Locale('vi', 'VN'));
                        Get.back();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text('About'.tr),
            onTap: () {
              Get.defaultDialog(
                title: 'About'.tr,
                content: Text('Todo App with Supabase & GetX'.tr),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('Logout'.tr),
            onTap: () async {
              await Supabase.instance.client.auth.signOut();
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}

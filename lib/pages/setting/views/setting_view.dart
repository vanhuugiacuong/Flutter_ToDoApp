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
      appBar: AppBar(title: Text('Settings'.tr), centerTitle: true),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('Language'.tr),
            trailing: Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Locale>(
                    value: controller.currentLocale.value,
                    dropdownColor:
                        Theme.of(
                          context,
                        ).cardColor, // Màu nền dropdown theo theme
                    items: const [
                      DropdownMenuItem(
                        value: Locale('en', 'US'),
                        child: Text('English'),
                      ),
                      DropdownMenuItem(
                        value: Locale('vi', 'VN'),
                        child: Text('Tiếng Việt'),
                      ),
                    ],
                    onChanged: (Locale? locale) {
                      if (locale != null) {
                        controller.changeLanguage(locale);
                      }
                    },
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color:
                          Theme.of(
                            context,
                          ).iconTheme.color, // Màu icon theo theme
                    ),
                    isDense: true,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          Theme.of(
                            context,
                          ).textTheme.bodyLarge?.color, // Màu chữ theo theme
                    ),
                  ),
                ),
              ),
            ),
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
            leading: const Icon(Icons.dark_mode),
            title: Text('Dark Mode'.tr),
            trailing: Obx(
              () => Switch.adaptive(
                value: controller.isDarkMode.value,
                onChanged: (val) => controller.toggleTheme(),

                //màu sắc khi tắt
                activeColor: Colors.white, // Màu nút khi bật
                inactiveThumbColor: Colors.grey[300], // Màu nút khi tắt
                inactiveTrackColor: Colors.grey[400], // Màu nền khi tắt
              ),
            ),
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

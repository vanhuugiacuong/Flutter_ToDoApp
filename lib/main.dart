import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertodosappsupabase/app/my_translations.dart';
import 'package:fluttertodosappsupabase/firebase_options.dart';
import 'package:fluttertodosappsupabase/pages/signup/controllers/signup_controller.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Supabase.initialize(
    url: 'https://xmxyosqfvqkfeuavtrxx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhteHlvc3FmdnFrZmV1YXZ0cnh4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDczOTQxMDgsImV4cCI6MjA2Mjk3MDEwOH0.hJguz4DDzvazu-LNmjKfLb_NiSG8xvhMSDPFEvMPfyg',
  );

  // Get.put(SignupController()); // Initialize SignupController

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Todos App',
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'), // Default locale
      fallbackLocale: const Locale('en', 'US'), // Fallback locale
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute:
          AppPages.INITIAL, // Ensure this points to the correct initial route
      getPages: AppPages.routes,
    );
  }
}

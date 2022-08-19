import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/pages/auth/controller/auth_controller.dart';
import 'src/routes/app_pages.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Grocer',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      // home: const SplashScreen(),
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    );
  }
}

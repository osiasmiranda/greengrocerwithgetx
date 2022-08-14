import 'package:get/get.dart';
import '../pages/auth/sign_in_screen.dart';
import '../pages/auth/sign_up_screen.dart';
import '../pages/base/base_screen.dart';
import '../pages/splash/splash_screen.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.base,
      page: () => const BaseScreen(),
    ),
  ];
}

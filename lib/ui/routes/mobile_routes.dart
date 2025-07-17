import 'package:bmr/ui/screens/date_in_out/date_in_out_screen.dart';
import 'package:bmr/ui/screens/home/home_screen.dart';
import 'package:bmr/ui/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../screens/page_not_found.dart';
import '../screens/splash/splash_screen.dart';

final GoRouter mobileRoutes = GoRouter(
  navigatorKey: Get.key,
  initialLocation: AppPath.homePath,
  errorBuilder: (context, state) {
    return const PageNotFound();
  },
  routes: [
    GoRoute(
      path: AppPath.splashPath,
      name: AppPath.splashPath,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppPath.loginPath,
      name: AppPath.loginPath,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppPath.homePath,
      name: AppPath.homePath,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: AppPath.dateInOutPath,
      name: AppPath.dateInOutPath,
      builder: (context, state) => DateInOutScreen(),
    ),
  ],
);

class AppPath {
  static String splashPath = "/";
  static String loginPath = "/login";
  static String homePath = "/home";
  static String dateInOutPath = "/dateInOut";
}

import 'package:bmr/controllers/auth_controller.dart';
import 'package:bmr/ui/routes/app_routes.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: LightTheme.getMyLightTheme(),
      routerDelegate: MyRoutes().getMyRoutes(context).routerDelegate,
      backButtonDispatcher:
          MyRoutes().getMyRoutes(context).backButtonDispatcher,
      routeInformationParser:
          MyRoutes().getMyRoutes(context).routeInformationParser,
      routeInformationProvider:
          MyRoutes().getMyRoutes(context).routeInformationProvider,
      // routerConfig: router,
      initialBinding: InitialBindings(),
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}

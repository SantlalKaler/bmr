import 'package:bmr/controllers/auth_controller.dart';
import 'package:bmr/controllers/conectivity_controller.dart';
import 'package:bmr/controllers/custom_controller.dart';
import 'package:bmr/controllers/customer_controller.dart';
import 'package:bmr/controllers/employee_controller.dart';
import 'package:bmr/controllers/map_controller.dart';
import 'package:bmr/controllers/pond_controller.dart';
import 'package:bmr/controllers/sampling_controller.dart';
import 'package:bmr/controllers/todo_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/data/pref_data.dart';
import 'package:bmr/ui/routes/app_routes.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:bmr/utils/gps_logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/feedback_controller.dart';
import 'controllers/harvest_controller.dart';
import 'controllers/leave_controller.dart';
import 'controllers/management_controller.dart';
import 'controllers/task_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  sendGPSLocation();
  runApp(const MyApp());
}

void sendGPSLocation() async {
  try {
    var user = await PrefData.getUser();
    if (user != null) {
      GpsLogger gpsLogger = GpsLogger();
      gpsLogger.startGpsLogging();
    }
  } catch (e) {
    print("Error in background location task: $e");
  }
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
    Get.put(ConnectivityController());
    Get.put(AuthController());
    Get.put(UserController());
    Get.put(MapController());
    Get.put(CustomController());
    Get.put(CustomerController());
    Get.put(EmployeeController());
    Get.put(FeedbackController());
    Get.put(HarvesterController());
    Get.put(LeaveController());
    Get.put(ManagementController());
    Get.put(PondController());
    Get.put(SamplingController());
    Get.put(TaskController());
    Get.put(TodoController());
  }
}

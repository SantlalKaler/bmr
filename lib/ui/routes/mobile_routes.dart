import 'package:bmr/data/model/task.dart';
import 'package:bmr/ui/constants/constant.dart';
import 'package:bmr/ui/screens/approval/approval_screen.dart';
import 'package:bmr/ui/screens/date_in_out/day_in_out_screen.dart';
import 'package:bmr/ui/screens/farmer/create_farmer_screen.dart';
import 'package:bmr/ui/screens/feedback/feedback_screen.dart';
import 'package:bmr/ui/screens/harvesting/create_harvest_screen.dart';
import 'package:bmr/ui/screens/harvesting/direct_harvest.dart';
import 'package:bmr/ui/screens/harvesting/harvesting_screen.dart';
import 'package:bmr/ui/screens/harvesting/history_harvest_screen.dart';
import 'package:bmr/ui/screens/home/home_screen.dart';
import 'package:bmr/ui/screens/leave_request/leave_request_screen.dart';
import 'package:bmr/ui/screens/login/login_screen.dart';
import 'package:bmr/ui/screens/pond/pond_screen.dart';
import 'package:bmr/ui/screens/pond/technical_quries_screen.dart';
import 'package:bmr/ui/screens/profile/change_password_screen.dart';
import 'package:bmr/ui/screens/profile/profile_screen.dart';
import 'package:bmr/ui/screens/sampling/create_sampling_screen.dart';
import 'package:bmr/ui/screens/sampling/direct_sampling.dart';
import 'package:bmr/ui/screens/sampling/sampling_screen.dart';
import 'package:bmr/ui/screens/task/assign_task_screen.dart';
import 'package:bmr/ui/screens/task/create_task_screen.dart';
import 'package:bmr/ui/screens/task/current_day_task_screen.dart';
import 'package:bmr/ui/screens/task/task_history_screen.dart';
import 'package:bmr/ui/screens/task/view_task_screen.dart';
import 'package:bmr/ui/screens/todo/todo_list_screen.dart';
import 'package:bmr/ui/screens/tracking/employee_route_history.dart';
import 'package:bmr/ui/screens/tracking/location_screen.dart';
import 'package:bmr/ui/screens/tracking/map_view.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../screens/page_not_found.dart';
import '../screens/pond/create_pond_screen.dart';
import '../screens/pond/direct_technical.dart';
import '../screens/pond/pond_details_screen.dart';
import '../screens/sampling/history_sampling_screen.dart';
import '../screens/splash/splash_screen.dart';

final GoRouter mobileRoutes = GoRouter(
  navigatorKey: Get.key,
  initialLocation: AppPath.splashPath,
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
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        path: AppPath.dateInOutPath,
        name: AppPath.dateInOutPath,
        builder: (context, state) {
          final dayIn = state.extra as bool? ?? false; // fallback to false
          return DayInOutScreen(dayIn: dayIn);
        }),
    GoRoute(
      path: AppPath.currentDayPath,
      name: AppPath.currentDayPath,
      builder: (context, state) => const CurrentDayTaskScreen(),
    ),
    GoRoute(
        path: AppPath.creteTaskPath,
        name: AppPath.creteTaskPath,
        builder: (context, state) {
          var param = state.extra == null ? null : state.extra as Task;
          return CreateTaskScreen(
            task: param,
          );
        }),
    GoRoute(
      path: AppPath.sampling,
      name: AppPath.sampling,
      builder: (context, state) {
        var customerId = state.extra;
        return SamplingScreen(
          customerId: state.extra != null ? state.extra as String : null,
        );
      },
    ),
    GoRoute(
      path: AppPath.createPond,
      name: AppPath.createPond,
      builder: (context, state) => const CreatePondScreen(),
    ),
    GoRoute(
      path: AppPath.createSampling,
      name: AppPath.createSampling,
      builder: (context, state) {
        var data = state.extra as Map;
        var custId = data['custId'];
        var pondId = data['pondId'];
        var cycleId = data['cycleId'];
        return CreateSamplingScreen(
          custId: custId,
          pondId: pondId,
          cycleId: cycleId,
        );
      },
    ),
    GoRoute(
        path: AppPath.historySampling,
        name: AppPath.historySampling,
        builder: (context, state) {
          var data = state.extra as Map;
          var custId = data['custId'];
          var cycleId = data['cycleId'];
          var pondId = data['pondId'];
          var request = data['request'];
          return HistorySamplingScreen(
            custId: custId,
            cycleId: cycleId,
            pondId: pondId,
            request: request,
          );
        }),
    GoRoute(
        path: AppPath.harvest,
        name: AppPath.harvest,
        builder: (context, state) {
          return HarvestingScreen(
            customerId: state.extra != null ? state.extra as String : null,
          );
        }),
    GoRoute(
        path: AppPath.enterHarvest,
        name: AppPath.enterHarvest,
        builder: (context, state) {
          var data = state.extra as Map;
          var custId = data['custId'];
          var pondId = data['pondId'];
          var cycleId = data['cycleId'];
          return CreateHarvestScreen(
            custId: custId,
            pondId: pondId,
            cycleId: cycleId,
          );
        }),
    GoRoute(
        path: AppPath.historyHarvest,
        name: AppPath.historyHarvest,
        builder: (context, state) {
          var data = state.extra as Map;
          var custId = data['custId'];
          var cycleId = data['cycleId'];
          var pondId = data['pondId'];
          var request = data['request'];
          return HistoryHarvestScreen(
            custId: custId,
            cycleId: cycleId,
            pondId: pondId,
            request: request,
          );
        }),
    GoRoute(
      path: AppPath.pondList,
      name: AppPath.pondList,
      builder: (context, state) => const PondScreen(),
    ),
    GoRoute(
        path: AppPath.pondDetails,
        name: AppPath.pondDetails,
        builder: (context, state) {
          var data = state.extra as Map;
          var cycleId = data['cycleId'];
          var pondId = data['pondId'];
          return PondDetailsScreen(
            cycleId: cycleId,
            pondId: pondId,
          );
        }),
    GoRoute(
      path: AppPath.technicalQuries,
      name: AppPath.technicalQuries,
      builder: (context, state) => const TechnicalQuriesScreen(),
    ),
    GoRoute(
      path: AppPath.feedback,
      name: AppPath.feedback,
      builder: (context, state) => const FeedbackScreen(),
    ),
    GoRoute(
      path: AppPath.directSampling,
      name: AppPath.directSampling,
      builder: (context, state) => const DirectSamplingScreen(),
    ),
    GoRoute(
      path: AppPath.directHarvest,
      name: AppPath.directHarvest,
      builder: (context, state) => const DirectHarvestScreen(),
    ),
    GoRoute(
      path: AppPath.directTechnical,
      name: AppPath.directTechnical,
      builder: (context, state) => const DirectTechnicalScreen(),
    ),
    GoRoute(
      path: AppPath.taskHistory,
      name: AppPath.taskHistory,
      builder: (context, state) => const TaskHistoryScreen(),
    ),
    GoRoute(
      path: AppPath.profile,
      name: AppPath.profile,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: AppPath.changePassword,
      name: AppPath.changePassword,
      builder: (context, state) => const ChangePasswordScreen(),
    ),
    GoRoute(
      path: AppPath.leaveRequest,
      name: AppPath.leaveRequest,
      builder: (context, state) => const LeaveRequestScreen(),
    ),
    GoRoute(
      path: AppPath.viewTask,
      name: AppPath.viewTask,
      builder: (context, state) => const ViewTaskScreen(),
    ),
    GoRoute(
      path: AppPath.locationTracking,
      name: AppPath.locationTracking,
      builder: (context, state) => const LocationScreen(),
    ),
    GoRoute(
      path: AppPath.employeeRouteHistory,
      name: AppPath.employeeRouteHistory,
      builder: (context, state) {
        // Extract the regionId from the state if available, otherwise use an empty string
        final regionId = state.extra as String?;
        Constant.printValue("Region id passes is ${regionId}");
        return EmployeeRouteHistory(regionId: regionId!);
      },
    ),
    GoRoute(
      path: AppPath.approval,
      name: AppPath.approval,
      builder: (context, state) => const ApprovalScreen(),
    ),
    GoRoute(
      path: AppPath.createFarmer,
      name: AppPath.createFarmer,
      builder: (context, state) => const CreateFarmerScreen(),
    ),
    GoRoute(
      path: AppPath.todoList,
      name: AppPath.todoList,
      builder: (context, state) => const ToDoListScreen(),
    ),
    GoRoute(
      path: AppPath.assignTask,
      name: AppPath.assignTask,
      builder: (context, state) => const AssignTaskScreen(),
    ),
    GoRoute(
        path: AppPath.mapView,
        name: AppPath.mapView,
        builder: (context, state) {
          return MapView(
            currentLocation: state.extra as bool,
          );
        }),
  ],
);

class AppPath {
  static String splashPath = "/";
  static String loginPath = "/login";
  static String homePath = "/home";
  static String dateInOutPath = "/dateInOut";
  static String currentDayPath = "/currentDay";
  static String creteTaskPath = "/creteTask";
  static String sampling = "/sampling";
  static String createPond = "/createPond";
  static String createSampling = "/createSampling";
  static String historySampling = "/historySampling";
  static String harvest = "/harvest";
  static String enterHarvest = "/enterHarvest";
  static String historyHarvest = "/historyHarvest";
  static String pondList = "/pondList";
  static String pondDetails = "/pondDetails";
  static String technicalQuries = "/technicalQuries";
  static String feedback = "/feedback";
  static String directSampling = "/directSampling";
  static String directHarvest = "/directHarvest";
  static String directTechnical = "/directTechnical";
  static String taskHistory = "/taskHistory";
  static String profile = "/profile";
  static String mapView = "/mapView";
  static String changePassword = "/changePassword";
  static String leaveRequest = "/leaveRequest";
  static String viewTask = "/viewTask";
  static String locationTracking = "/locationTracking";
  static String employeeRouteHistory = "/employeeRouteHistory";
  static String approval = "/approval";
  static String createFarmer = "/createFarmer";
  static String todoList = "/todoList";
  static String assignTask = "/assignTask";
}

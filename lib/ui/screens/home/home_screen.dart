import 'package:bmr/controllers/auth_controller.dart';
import 'package:bmr/controllers/map_controller.dart';
import 'package:bmr/data/pref_data.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/constants/image_constants.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../controllers/employee_controller.dart';
import '../../routes/mobile_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Are you sure want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            }, // No
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              PrefData.clearUser();
              context.pushReplacement(AppPath.loginPath);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  AuthController authController = Get.find();
  EmployeeController employeeController = Get.find();
  MapController mapController = Get.find();

  @override
  void initState() {
    super.initState();
    // mapController.getCurrentLocation();
    employeeController.dayInStatusVerification();
  }

  @override
  Widget build(BuildContext context) {
    employeeController.getHoursLoggedTime();
    final List<Map<String, dynamic>> dashboardTiles = [
      {
        'title': 'Current Day Task',
        'color': Colors.blue,
        'onTap': () {
          context.push(AppPath.currentDayPath);
        },
        'icon':
            ImageConstants.currentDayTask, // 🔍 Replace with appropriate icon
        'comment': 'Tasks Icon'
      },
      {
        'title': 'View Task',
        'color': Colors.green,
        'onTap': () {
          context.push(AppPath.viewTask);
        },
        'icon': ImageConstants.viewTask, // 🔍 Replace with appropriate icon
        'comment': 'Attendance Icon'
      },
      {
        'title': 'Assign Task',
        'color': Colors.orange,
        'onTap': () {
          context.push(AppPath.assignTask);
        },
        'icon': ImageConstants.assignTask, // 🔍 Replace with appropriate icon
        'comment': 'Leave Icon'
      },
      {
        'title': 'Sampling',
        'color': Colors.red,
        'onTap': () {
          context.push(AppPath.directSampling);
        },
        'icon': ImageConstants.sampling, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
      {
        'title': 'Harvest',
        'color': Colors.teal,
        'onTap': () {
          context.push(AppPath.directHarvest);
        },
        'icon': ImageConstants.harvest, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
      {
        'title': 'Technical',
        'color': Colors.black,
        'onTap': () {
          context.push(AppPath.directTechnical);
        },
        'icon': ImageConstants.technical, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
      {
        'title': 'Location Tracing',
        'color': Colors.purpleAccent,
        'onTap': () {
          context.push(AppPath.locationTracking);
        },
        'icon':
            ImageConstants.locationTracking, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
      {
        'title': 'Approval',
        'color': Colors.indigo,
        'onTap': () {
          context.push(AppPath.approval);
        },
        'icon': ImageConstants.approved, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
      {
        'title': 'Customers',
        'color': Colors.cyan,
        'onTap': () {
          context.push(AppPath.createFarmer);
        },
        'icon': ImageConstants.customers, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
      {
        'title': 'To Do List',
        'color': Colors.blueGrey,
        'onTap': () {
          context.push(AppPath.todoList);
        },
        'icon': ImageConstants.toDoList, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
      {
        'title': 'Task History',
        'color': Colors.purple,
        'onTap': () {
          context.push(AppPath.taskHistory);
        },
        'icon': ImageConstants.taskHistory, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
      {
        'title': 'Profile',
        'color': Colors.brown,
        'onTap': () {
          context.push(AppPath.profile);
        },
        'icon': ImageConstants.profile, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          ImageConstants.logo,
          height: 40,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_email_read_outlined),
            color: primaryColor,
            onPressed: () {
              _logout(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            color: primaryColor,
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(DimensConstants.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello, ${authController.user?.empName}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    DateFormat('dd MMM, EEE').format(DateTime.now()).toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const Gap(10),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "House Logged: ${employeeController.hoursLogged}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),

              const Gap(20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        String checkInUpdateId = await PrefData.getCheckInId();
                        context.push(AppPath.dateInOutPath,
                            extra: checkInUpdateId.isEmpty ? true : false);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(100),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Theme.of(context).primaryColor,
                              primaryColorDark,
                            ],
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.login_outlined,
                                color: Colors.white,
                              ),
                              Gap(5),
                              Text(
                                "Day In: 00:00",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.push(AppPath.dateInOutPath, extra: false);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(100),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Theme.of(context).primaryColor,
                              primaryColorDark,
                            ],
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              Gap(5),
                              Text(
                                "Day Out: 00:00",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const Gap(20),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Theme.of(context).primaryColor,
                      primaryColorDark,
                    ],
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Tasks",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Total Sampling",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Total Harvesting",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              const Gap(20),

              // Grid View Tiles
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: dashboardTiles.map((tile) {
                  return GestureDetector(
                    onTap: tile['onTap'],
                    child: Container(
                      decoration: BoxDecoration(
                        color: tile['color'].withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(tile['icon'],
                              height: 30, width: 30, color: tile['color']),
                          const Gap(10),
                          Text(
                            tile['title'],
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: tile['color']),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/data/model/user.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../controllers/task_controller.dart' show TaskController;
import '../widgets/top_app_bar.dart';
import 'components/current_day.dart';

class CurrentDayTaskScreen extends StatefulWidget {
  const CurrentDayTaskScreen({super.key});

  @override
  State<CurrentDayTaskScreen> createState() => _CurrentDayTaskScreenState();
}

class _CurrentDayTaskScreenState extends State<CurrentDayTaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  TaskController taskController = Get.find();
  UserController userController = Get.find();
  User? user;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      taskController.changeTabIndex(tabController.index);
      getTasks();
    });
    user = userController.user;
    getTasks();
  }

  void getTasks() async {
    if (tabController.index == 0) {
      await taskController.getCurrentDayTaskList();
    } else {
      await taskController.getPendingTaskList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
        init: TaskController(),
        builder: (controller) {
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: const PreferredSize(
                  preferredSize: Size(double.infinity, 120),
                  child: TopAppBar(
                    title: "Tasks",
                  ),
                ),
                floatingActionButton: controller.tabIndex.value == 0
                    ? FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          context.push(AppPath.creteTaskPath);
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      )
                    : null,
                body: Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      tabs: const [
                        Tab(text: "Current Day Tasks"),
                        Tab(text: "Pending Tasks"),
                      ],
                    ),
                    Obx(
                      () => taskController.loading.isTrue
                          ? const Center(child: AppLoader())
                          : Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: const [
                                  CurrentDay(),
                                  Center(child: Text("Tomorrow's Tasks")),
                                ],
                              ),
                            ),
                    )
                  ],
                ),
              ));
        });
  }
}

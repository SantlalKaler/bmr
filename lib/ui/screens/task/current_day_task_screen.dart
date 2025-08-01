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
  TaskController currentDayTaskController = Get.find();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      currentDayTaskController.changeTabIndex(tabController.index);
    });
    super.initState();
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
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          CurrentDay(),
                          Center(child: Text("Tomorrow's Tasks")),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}

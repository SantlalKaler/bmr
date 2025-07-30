import 'package:bmr/controllers/current_day_task_controller.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../widgets/top_app_bar.dart';

class ViewTaskScreen extends StatefulWidget {
  const ViewTaskScreen({super.key});

  @override
  State<ViewTaskScreen> createState() => _ViewTaskScreenState();
}

class _ViewTaskScreenState extends State<ViewTaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  CurrentDayTaskController currentDayTaskController = Get.find();

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    tabController.addListener(() {
      currentDayTaskController.changeTabIndex(tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrentDayTaskController>(
        init: CurrentDayTaskController(),
        builder: (controller) {
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: const PreferredSize(
                  preferredSize: const Size(double.infinity, 120),
                  child: TopAppBar(
                    title: "View Task",
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
                        Tab(text: "Monday"),
                        Tab(text: "Tuesday"),
                        Tab(text: "Wednesday"),
                        Tab(text: "Thursday"),
                        Tab(text: "Friday"),
                        Tab(text: "Saturday"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          Center(child: Text("Tasks")),
                          Center(child: Text("Tasks")),
                          Center(child: Text("Tasks")),
                          Center(child: Text("Tasks")),
                          Center(child: Text("Tasks")),
                          Center(child: Text("Tasks")),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}

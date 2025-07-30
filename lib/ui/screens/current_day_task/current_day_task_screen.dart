import 'package:bmr/controllers/current_day_task_controller.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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
  CurrentDayTaskController currentDayTaskController = Get.find();

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
    return GetBuilder<CurrentDayTaskController>(
        init: CurrentDayTaskController(),
        builder: (controller) {
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: const PreferredSize(
                  preferredSize: const Size(double.infinity, 120),
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

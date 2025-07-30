import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/current_day_task_controller.dart';
import '../widgets/top_app_bar.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen>
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
              backgroundColor: scaffoldBackgroundColor,
              appBar: const PreferredSize(
                preferredSize: Size(double.infinity, 120),
                child: TopAppBar(
                  title: "To do List",
                ),
              ),
              body: Padding(
                padding: EdgeInsets.all(DimensConstants.screenPadding),
                child: Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      tabs: const [
                        Tab(text: "My To-do List"),
                        Tab(text: "Assigned By Me"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          Center(child: Text("Tomorrow's Tasks")),
                          Center(child: Text("Tomorrow's Tasks")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

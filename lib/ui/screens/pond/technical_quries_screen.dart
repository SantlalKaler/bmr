import 'package:bmr/controllers/current_day_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/top_app_bar.dart';
import 'components/technical.dart';

class TechnicalQuriesScreen extends StatefulWidget {
  const TechnicalQuriesScreen({super.key});

  @override
  State<TechnicalQuriesScreen> createState() => _TechnicalQuriesScreenState();
}

class _TechnicalQuriesScreenState extends State<TechnicalQuriesScreen>
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
                body: Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      tabs: const [
                        Tab(text: "Technical"),
                        Tab(text: "Feed Quality Test"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          Technical(),
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

import 'package:bmr/controllers/current_day_task_controller.dart';
import 'package:bmr/ui/screens/feedback/sales.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/top_app_bar.dart';
import 'collection.dart';
import 'general.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  CurrentDayTaskController currentDayTaskController = Get.find();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
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
                    title: "Feedback",
                  ),
                ),
                body: Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      tabs: const [
                        Tab(text: "General"),
                        Tab(text: "Sales"),
                        Tab(text: "Collection"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          General(),
                          Sales(),
                          Collection(),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}

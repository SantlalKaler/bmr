import 'package:bmr/ui/screens/approval/components/task_approval.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/task_controller.dart';
import '../widgets/top_app_bar.dart';

class ApprovalScreen extends StatefulWidget {
  const ApprovalScreen({super.key});

  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen>
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
    return GetBuilder(
        init: TaskController(),
        builder: (controller) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size(double.infinity, 120),
                child: TopAppBar(
                  title: "Approval",
                ),
              ),
              body: Column(
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: const [
                      Tab(text: "Task Approval"),
                      Tab(text: "Leave Approval"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        TaskApproval(),
                        Center(child: Text("Leave Approval")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

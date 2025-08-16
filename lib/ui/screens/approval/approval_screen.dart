import 'package:bmr/controllers/custom_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/ui/screens/approval/components/leave_approval.dart';
import 'package:bmr/ui/screens/approval/components/task_approval.dart';
import 'package:bmr/utils/date_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/leave_controller.dart';
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
  TaskController taskController = Get.find();
  CustomController customController = Get.find();
  LeaveController leaveController = Get.find();
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      taskController.changeTabIndex(tabController.index);
      getApproval();
    });
    super.initState();
    customController.getZoneList();
    getApproval();
  }

  void getApproval() async {
    UserController userController = Get.find();
    String empId = userController.user?.eId ?? '';
    String regionId = userController.user?.regionId ?? '';
    if (tabController.index == 0) {
      await taskController.getPendingTaskApprovalList(
          empId: empId,
          regionId: regionId,
          fromDate:
              DateConverter.convertDate(DateTime.now(), format: "dd-MM-yyyy"),
          toDate:
              DateConverter.convertDate(DateTime.now(), format: "dd-MM-yyyy"));
    } else {
      await leaveController.getLeaveApprovalList();
    }
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
                      children: const [TaskApproval(), LeaveApproval()],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

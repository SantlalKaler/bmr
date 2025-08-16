import 'package:bmr/controllers/custom_controller.dart';
import 'package:bmr/controllers/leave_controller.dart';
import 'package:bmr/controllers/task_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/customer_controller.dart';

class LeaveApproval extends StatefulWidget {
  const LeaveApproval({super.key});

  @override
  State<LeaveApproval> createState() => _LeaveApprovalState();
}

class _LeaveApprovalState extends State<LeaveApproval> {
  String? selectedValue;

  TaskController taskController = Get.find();
  CustomController customController = Get.find();
  CustomerController customerController = Get.find();
  LeaveController leaveController = Get.find();
  UserController userController = Get.find();

  getPendingLeaveList() {
    leaveController.getLeaveApprovalList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => leaveController.loading.isTrue
                  ? const AppLoader()
                  : Center(child: const Text("No Leave request found"))
              /*   : leaveController.taskList.isEmpty
                  ? const Text("No task found")
              : Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20),
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: taskController.taskList.length,
                    itemBuilder: (context, index) {
                      var task = taskController.taskList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: SingleTaskHistory(
                          task: task,
                        ),
                      );
                    },
                  ),
                )),*/
              )
        ],
      ),
    );
  }
}

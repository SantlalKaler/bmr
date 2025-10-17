import 'package:bmr/controllers/custom_controller.dart';
import 'package:bmr/controllers/leave_controller.dart';
import 'package:bmr/controllers/task_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      body: Obx(() => leaveController.loading.isTrue
          ? const AppLoader()
          : leaveController.leaves.isEmpty
              ? const Text("No data found")
              : ListView.builder(
                  padding: EdgeInsetsGeometry.all(10),
                  itemCount: leaveController.leaves.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var leave = leaveController.leaves[index];
                    return Card(
                        child: Padding(
                      padding: const EdgeInsetsGeometry.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconWithData(
                                  Icons.person, leave.approvedEmpName ?? ""),
                              IconWithData(
                                  Icons.calendar_month, leave.fromDate ?? ""),
                            ],
                          ),
                          Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconWithData(Icons.edit_calendar_sharp,
                                  leave.leaveDays ?? ""),
                              IconWithData(
                                  Icons.circle, leave.leaveStatus ?? "",
                                  color: leave.leaveStatus == "Approved"
                                      ? Colors.green
                                      : leave.leaveStatus == "Pending"
                                          ? Colors.orangeAccent
                                          : leave.leaveStatus == "Cancelled"
                                              ? Colors.red
                                              : null),
                            ],
                          ),
                        ],
                      ),
                    ));
                  },
                )),
    );
  }
}

Widget IconWithData(IconData icon, String data, {Color? color}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        icon,
        color: color ?? Colors.black87,
        size: 20,
      ),
      const Gap(10),
      Text(data, style: TextStyle(color: color ?? Colors.black45))
    ],
  );
}

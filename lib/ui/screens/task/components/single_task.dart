import 'dart:convert';

import 'package:bmr/controllers/map_controller.dart';
import 'package:bmr/controllers/task_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/data/model/task.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/elements/app_snackbar.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'visit_details_dialog.dart';

class SingleTask extends StatefulWidget {
  Task task;

  SingleTask({super.key, required this.task});

  @override
  State<SingleTask> createState() => _SingleTaskState();
}

class _SingleTaskState extends State<SingleTask> {
  bool _showDetails = false;
  TaskController taskController = Get.find();
  MapController mapController = Get.find();
  UserController userController = Get.find();

  void showVisitDetailsDialogs(BuildContext context) {
    taskController.selectedTask = widget.task;
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: VisitDetailsDialog(
          customerId: widget.task.customerId!,
        ),
      ),
    );
  }

  void showStatusChangeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Obx(() => AlertDialog(
              content: const Text("Task Approval Status"),
              actions: taskController.loading.isTrue
                  ? [const AppLoader()]
                  : [
                      TextButton(
                        onPressed: () async {
                          await taskController.updateTaskStatus(
                              userId: userController.user!.eId!,
                              taskId: widget.task!.id!,
                              approvedStatus: '2');

                          if (taskController.apiCallSuccess.isTrue) {
                            context.pop();
                          } else {
                            AppSnackBar.showSnackBar(
                                taskController.errorMessage);
                          }
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                          onPressed: () async {
                            await taskController.updateTaskStatus(
                                userId: userController.user!.eId!,
                                taskId: widget.task.id!,
                                approvedStatus: '1');
                            if (taskController.apiCallSuccess.isTrue) {
                              context.pop();
                            } else {
                              AppSnackBar.showSnackBar(
                                  taskController.errorMessage);
                            }
                          },
                          child: const Text("Approve"))
                    ],
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showDetails = !_showDetails;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.supervised_user_circle_outlined,
                      color: primaryColorDark,
                    ),
                    const Gap(15),
                    Text(
                      widget.task.customername ?? "",
                      style: TextStyle(
                          color: primaryColorDark, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text(
                  widget.task.createdDate ?? "",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    showStatusChangeDialog(context);
                  },
                  child: Text(
                    widget.task.approvedStatus == "0"
                        ? "Pending"
                        : widget.task.approvedStatus == "2"
                            ? "Cancelled"
                            : "Approved",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                // Text(
                //   "General",
                //   style: Theme.of(context).textTheme.bodySmall,
                // ),
                IconButton(
                    onPressed: () {
                      context.push(AppPath.creteTaskPath, extra: widget.task);
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 20,
                      color: primaryColor,
                    ))
              ],
            ),

            /// Animated Section
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.location ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(20),
                    Text(
                      "Created By: ${widget.task.sname ?? ""}",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Obx(() => Expanded(
                              child: taskController.checkInLoading.isTrue
                                  ? const AppLoader()
                                  : GestureDetector(
                                      onTap: () {
                                        taskCheckIn();
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Theme.of(context).primaryColor,
                                                primaryColorDark,
                                                Theme.of(context).primaryColor,
                                              ],
                                            ),
                                          ),
                                          child: const Text(
                                            "CheckIn",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                            )),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (widget.task.checkedIn != null &&
                                  widget.task.checkedIn != "") {
                                showVisitDetailsDialogs(context);
                              }
                            },
                            child: Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white70),
                                child: Text(
                                  "Visit Details",
                                  style: TextStyle(color: Colors.grey.shade400),
                                )),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    if (widget.task.checkedIn != null &&
                        widget.task.checkedIn != "")
                      Text(
                        widget.task.checkedIn!,
                        style: TextStyle(fontSize: 12),
                      ),
                    const Gap(20),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Comments: ${widget.task.comments ?? ""}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState: _showDetails
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }

  void taskCheckIn() async {
    await taskController.taskCheckIn(
        tdId: widget.task.id!,
        checkIn: DateTime.now().toString(),
        geoCheckin: jsonEncode({
          "lat": mapController.currentLocation?.latitude.toString() ?? "",
          "lon": mapController.currentLocation?.longitude.toString() ?? "",
        }),
        empId: userController.user!.eId!);

    if (taskController.apiCallSuccess.isTrue) {
      AppSnackBar.showSnackBar(
        title: "Task CheckIn Successful",
        "You have successfully checked in to the task.",
      );
      taskController.getCurrentDayTaskList();
    } else {
      AppSnackBar.showSnackBar(
        taskController.errorMessage,
      );
    }
  }
}

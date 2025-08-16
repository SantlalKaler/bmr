import 'package:bmr/controllers/custom_controller.dart';
import 'package:bmr/controllers/task_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/customer_controller.dart';
import '../../../constants/dimens_constants.dart';
import '../../../theme_light.dart';
import '../../task/components/single_task_history.dart';

class TaskApproval extends StatefulWidget {
  const TaskApproval({super.key});

  @override
  State<TaskApproval> createState() => _TaskApprovalState();
}

class _TaskApprovalState extends State<TaskApproval> {
  String? selectedValue;

  TaskController taskController = Get.find();
  CustomController customController = Get.find();
  CustomerController customerController = Get.find();
  UserController userController = Get.find();

  getPendingTaskList() {
    var user = userController.user!;
    var zoneId =
        customerController.getSelectedZoneId(selectedZoneValue: selectedValue);
    taskController.getPendingTaskApprovalList(
        empId: user.eId!,
        regionId: zoneId ?? user.regionId!,
        fromDate: taskController.startDate.value,
        toDate: taskController.endDate.value);
  }

  void showFilterHistoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select Region"),
        content: Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton(
                  value: selectedValue,
                  hint: const Text("Select Zone"),
                  isExpanded: true, // Makes dropdown full width
                  items: customController.zoneListSting.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                ),
                const Gap(20),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsetsGeometry.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.shade100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: primaryColor,
                      ),
                      const Gap(10),
                      // open calendar when user click on it and save the data in local varibale
                      Expanded(
                          child: GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate:
                                      DateTime.now(), // restrict past dates
                                  lastDate: DateTime(2100), // adjust as needed
                                );

                                if (pickedDate != null) {
                                  setState(() {
                                    taskController.startDate.value =
                                        DateFormat('dd-MM-yyyy').format(
                                            pickedDate); // or use your preferred format
                                  });
                                }
                              },
                              child: Text(taskController.startDate.value.isEmpty
                                  ? "Start Date"
                                  : taskController.startDate.value))),
                      const Gap(10),
                      Icon(
                        Icons.calendar_month,
                        color: primaryColor,
                      ),
                      const Gap(10),
                      Expanded(
                          child: GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate:
                                      DateTime.now(), // restrict past dates
                                  lastDate: DateTime(2100), // adjust as needed
                                );

                                if (pickedDate != null) {
                                  taskController.endDate.value =
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickedDate);
                                }
                              },
                              child: Text(taskController.endDate.value.isEmpty
                                  ? "End Date"
                                  : taskController.endDate.value))),
                    ],
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text("Cancel"),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          getPendingTaskList();
                          context.pop();
                        },
                        child: const Text("Submit"),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(DimensConstants.screenPadding),
            child: GestureDetector(
              onTap: () {
                showFilterHistoryDialog(context);
              },
              child: TextField(
                enabled: false,
                readOnly: true,
                controller: TextEditingController(
                    text: taskController.selectedRegion.value),
                decoration: const InputDecoration(
                  hintText: "Region Name",
                ),
              ),
            ),
          ),
          const Gap(10),
          Obx(() => taskController.loading.isTrue
              ? const AppLoader()
              : taskController.taskList.isEmpty
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
                    )),
        ],
      ),
    );
  }
}

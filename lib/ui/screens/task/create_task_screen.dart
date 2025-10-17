import 'package:bmr/data/model/task.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/elements/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../controllers/customer_controller.dart';
import '../../../controllers/task_controller.dart';
import '../../elements/textfield_with_dropdown_suggestion.dart';
import '../widgets/app_choice_chip.dart';
import '../widgets/top_app_bar.dart';

class CreateTaskScreen extends StatefulWidget {
  final Task? task;
  const CreateTaskScreen({super.key, this.task});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TaskController taskController = Get.find();
  TextEditingController taskDate = TextEditingController();
  TextEditingController customerName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController location = TextEditingController();

  CustomerController customerController = Get.find();

  @override
  void initState() {
    super.initState();
    setData();
  }

  void setData() async {
    var task = widget.task;
    await customerController.getCustomerList();
    if (widget.task != null) {
      DateFormat format = DateFormat("dd-MM-yyyy");
      taskDate.text =
          DateFormat('MMM dd yyyy').format(format.parse(task!.createdDate!));
      customerName.text = task.customername ?? "";
      description.text = task.description ?? "";
      location.text = task.location ?? "";
      taskController.selectedItem.value =
          (num.parse(task.transport ?? "0") - 1).toInt();
    }
  }

  void createTaskSummary() async {
    // check if all fields are filled
    if (description.text.isEmpty ||
        // location.text.isEmpty ||
        taskDate.text.isEmpty ||
        customerName.text.isEmpty) {
      AppSnackBar.showSnackBar(
        "Please fill all fields",
      );
      return;
    } else {
      await taskController.createTaskSummary(
          description.text,
          location.text,
          "0",
          customerName.text,
          (taskController.selectedItem.value + 1).toString(),
          "");

      if (taskController.apiCallSuccess.isTrue) {
        AppSnackBar.showSnackBar("Task created successfully");
        context.pop();
      } else {
        AppSnackBar.showSnackBar("Failed to create task");
      }
    }
  }

  void updateTaskSummary() async {
    // check if all fields are filled
    if (description.text.isEmpty ||
        // location.text.isEmpty ||
        taskDate.text.isEmpty ||
        customerName.text.isEmpty) {
      AppSnackBar.showSnackBar(
        "Please fill all fields",
      );
      return;
    } else {
      await taskController.updateTaskSummary(
          widget.task!.id!,
          description.text,
          location.text,
          "0",
          customerName.text,
          (taskController.selectedItem.value + 1).toString(),
          "");

      if (taskController.apiCallSuccess.isTrue) {
        AppSnackBar.showSnackBar("Task updated successfully");
        context.pop();
      } else {
        AppSnackBar.showSnackBar("Failed to update task");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
        init: TaskController(),
        builder: (controller) {
          return Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size(double.infinity, 120),
              child: TopAppBar(
                title: "Create Task",
              ),
            ),
            floatingActionButton: Obx(() => GestureDetector(
                  onTap: () {
                    widget.task != null
                        ? updateTaskSummary()
                        : createTaskSummary();
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: controller.loading.isTrue
                        ? const AppLoader(
                            color: Colors.white,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add_circle_rounded,
                                color: Colors.white,
                              ),
                              Gap(10),
                              Text(widget.task != null ? "Update" : "CREATE",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                  ),
                )),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(DimensConstants.screenPadding),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(), // restrict past dates
                        lastDate: DateTime(2100), // adjust as needed
                      );

                      if (pickedDate != null) {
                        taskDate.text = DateFormat('MMM dd yyyy')
                            .format(pickedDate); // or use your preferred format
                      }
                    },
                    child: TextField(
                      controller: taskDate,
                      enabled: false,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: "Task Date",
                      ),
                    ),
                  ),
                  const Gap(10),
                  Obx(
                    () => TextFieldWithDropdownSuggestion(
                      list: customerController.customersStringList,
                      subTitleList:
                          customerController.customersAddressList.isNotEmpty
                              ? customerController.customersAddressList
                              : null,
                      controller: customerName,
                      hintText: customerController.loading.isTrue
                          ? "Loading customer data..."
                          : 'Customer name',
                      onSelect: () {
                        location.text = customerController
                                .getCustomerLocationByName(customerName.text) ??
                            "";
                      },
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: description,
                    minLines: 5,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      hintText: "Description",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: location,
                    enabled: false,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: "Location",
                    ),
                  ),
                  const Gap(10),
                  AppChoiceChip(
                    choices: controller.items,
                    title: "",
                    customLabel: false,
                    spaceBetweenChips: 15,
                    onSelected: (int index) {
                      controller.setSelectedItem(index);
                    },
                    selectedChoice: controller.selectedItem.value,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

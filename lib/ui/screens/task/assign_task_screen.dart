import 'package:bmr/controllers/employee_controller.dart';
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

class AssignTaskScreen extends StatefulWidget {
  const AssignTaskScreen({super.key});

  @override
  State<AssignTaskScreen> createState() => _AssignTaskScreenState();
}

class _AssignTaskScreenState extends State<AssignTaskScreen> {
  TaskController createTaskController = Get.find();
  TextEditingController taskDate = TextEditingController();
  TextEditingController assignTo = TextEditingController();
  TextEditingController customerName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController location = TextEditingController();

  CustomerController customerController = Get.find();
  EmployeeController employeeController = Get.find();

  @override
  void initState() {
    super.initState();
    customerController.getCustomerList();
    employeeController.getEmployeeList();
  }

  // validate the form fields
  bool validateForm() {
    if (taskDate.text.isEmpty ||
        customerName.text.isEmpty ||
        assignTo.text.isEmpty) {
      AppSnackBar.showSnackBar("Please fill all data.");
      return false;
    }
    return true;
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
                title: "Assign Task",
              ),
            ),
            floatingActionButton: Obx(() => GestureDetector(
                  onTap: () {
                    createTask();
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
                        ? const AppLoader()
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_rounded,
                                color: Colors.white,
                              ),
                              Gap(10),
                              Text("CREATE",
                                  style: TextStyle(
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
                      list: employeeController.employeeListString,
                      controller: assignTo,
                      hintText: customerController.loading.isTrue
                          ? "Loading data..."
                          : 'Assign To',
                    ),
                  ),
                  const Gap(10),
                  Obx(
                    () => TextFieldWithDropdownSuggestion(
                      list: customerController.customersStringList,
                      controller: customerName,
                      hintText: customerController.loading.isTrue
                          ? "Loading customer data..."
                          : 'Customer name',
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

  createTask() async {
    if (validateForm()) {
      await createTaskController.createTaskSummary(
        description.text,
        location.text,
        "0",
        customerName.text,
        (createTaskController.selectedItem.value + 1).toString(),
        assignTo.text,
      );
    }

    if (createTaskController.apiCallSuccess.isTrue) {
      AppSnackBar.showSnackBar("Task created successfully");
      context.pop();
    } else {
      AppSnackBar.showSnackBar("Failed to create task");
    }
  }
}

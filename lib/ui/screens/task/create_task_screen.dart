import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/elements/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/customer_controller.dart';
import '../../../controllers/task_controller.dart';
import '../../elements/textfield_with_dropdown_suggestion.dart';
import '../widgets/app_choice_chip.dart';
import '../widgets/top_app_bar.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

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
    customerController.getCustomerList();
  }

  void createTaskSummary() {
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
      taskController.createTaskSummary(
          description.text,
          location.text,
          "0",
          taskController.selectedItem.value.toString(),
          // todo: send customer id here not name
          customerName.text);
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
                    createTaskSummary();
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
                      list: customerController.customers
                          .map((c) =>
                              "${c.firstName ?? ''} ${c.lastName ?? ''}".trim())
                          .toList(),
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
}

import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/create_task_controller.dart';
import '../widgets/app_choice_chip.dart';
import '../widgets/top_app_bar.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  CreateTaskController createTaskController = Get.find();
  TextEditingController taskDate = TextEditingController();
  TextEditingController customerName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateTaskController>(
        init: CreateTaskController(),
        builder: (controller) {
          return Scaffold(
            appBar: const PreferredSize(
              preferredSize: const Size(double.infinity, 120),
              child: TopAppBar(
                title: "Create Task",
              ),
            ),
            floatingActionButton: Container(
              height: 40,
              width: 120,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
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
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              ),
            ),
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
                  TextField(
                    controller: customerName,
                    enabled: false,
                    decoration: const InputDecoration(
                      hintText: "Customer Name",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: description,
                    enabled: false,
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

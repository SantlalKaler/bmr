import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../widgets/top_app_bar.dart';
import 'components/single_task_history.dart';

class TaskHistoryScreen extends StatefulWidget {
  const TaskHistoryScreen({super.key});

  @override
  State<TaskHistoryScreen> createState() => _TaskHistoryScreenState();
}

class _TaskHistoryScreenState extends State<TaskHistoryScreen> {
  String? selectedValue;

  final List<String> items = ['Option 1', 'Option 2', 'Option 3'];

  void showFilterHistoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select Region"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton(
              value: selectedValue,
              hint: const Text("Option 1"),
              isExpanded: true, // Makes dropdown full width
              items: items.map((String item) {
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
            Gap(20),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsetsGeometry.all(10),
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
                  Gap(10),
                  Expanded(child: Text("20-01-2024")),
                  Gap(10),
                  Icon(
                    Icons.calendar_month,
                    color: primaryColor,
                  ),
                  Gap(10),
                  Expanded(child: Text("20-01-2025")),
                ],
              ),
            ),
            Gap(20),
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
                Gap(10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text("Submit"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 120),
        child: TopAppBar(
          title: "Task History",
        ),
      ),
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
                decoration: InputDecoration(
                  hintText: "Region Name",
                ),
              ),
            ),
          ),
          const Gap(10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 20),
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: SingleTaskHistory(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

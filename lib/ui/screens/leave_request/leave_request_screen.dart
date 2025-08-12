import 'package:bmr/controllers/leave_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_button.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/elements/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../controllers/user_controller.dart';
import '../widgets/top_app_bar.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  String? leaveType;
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController days = TextEditingController();
  TextEditingController purpose = TextEditingController();

  LeaveController leaveController = Get.find();

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100), // Latest selectable date
    );

    if (pickedDate != null) {
      setState(() {
        if (isFromDate) {
          fromDate.text =
              "${pickedDate.toLocal()}".split(' ')[0]; // Format date

          // if to date is empty then fill this date with same as from date
          if (toDate.text.isEmpty) {
            toDate.text = fromDate.text;
          }
        } else {
          // Ensure toDate is not before fromDate
          if (fromDate.text.isNotEmpty &&
              DateTime.parse(fromDate.text).isAfter(pickedDate)) {
            AppSnackBar.showSnackBar('To date cannot be before From date');
            return;
          }
          toDate.text = "${pickedDate.toLocal()}".split(' ')[0]; // Format date
        }

        // get difference in days between from date and to date
        updateTotalDays();
      });
    }
  }

  void updateTotalDays() {
    if (fromDate.text.isNotEmpty && toDate.text.isNotEmpty) {
      DateTime from = DateTime.parse(fromDate.text);
      DateTime to = DateTime.parse(toDate.text);
      int difference =
          to.difference(from).inDays + 1; // +1 to include both days
      days.text = difference.toString();
    } else if (fromDate.text.isNotEmpty) {
      days.text = "1"; // If only from date is selected, set days to 0
    } else {
      days.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Leave Request",
          )),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(DimensConstants.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Text("Leave Information in Days"),
            Gap(20),*/
            const Text("Leave Type"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: '1',
                  groupValue: leaveType,
                  onChanged: (value) {
                    setState(() {
                      leaveType = value;
                    });
                  },
                ),
                const Text('Casual'),
                const Gap(10),
                Radio<String>(
                  value: '2',
                  groupValue: leaveType,
                  onChanged: (value) {
                    setState(() {
                      leaveType = value;
                    });
                  },
                ),
                const Text('Sick'),
                const Gap(10),
                Radio<String>(
                  value: '3',
                  groupValue: leaveType,
                  onChanged: (value) {
                    setState(() {
                      leaveType = value;
                    });
                  },
                ),
                const Text('Privilege')
              ],
            ),
            const Gap(10),
            const Text("From date"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    _selectDate(context, true);
                  },
                  child: TextField(
                    controller: fromDate,
                    decoration: const InputDecoration(
                        hintText: "", suffixIcon: Icon(Icons.calendar_month)),
                    readOnly: true,
                    enabled: false,
                  ),
                )),
                /* const Gap(10),
                Expanded(
                    child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    const Text("Half")
                  ],
                ))*/
              ],
            ),
            const Gap(10),
            const Text("To date"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    _selectDate(context, false);
                    updateTotalDays();
                  },
                  child: TextField(
                    controller: toDate,
                    decoration: const InputDecoration(
                        hintText: "", suffixIcon: Icon(Icons.calendar_month)),
                    readOnly: true,
                    enabled: false,
                  ),
                )),
                /*  const Gap(10),
                Expanded(
                    child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    const Text("Half")
                  ],
                ))*/
              ],
            ),
            const Gap(10),
            const Text("Total number of days"),
            // in below textfiled we show total number of days between from date and to date
            // if from date is not selected, show 0

            TextField(
              controller: days,
              keyboardType: TextInputType.phone,
            ),
            const Gap(10),
            const Text("Purpose"),
            TextField(
              minLines: 5,
              maxLines: 10,
              controller: purpose,
            ),
            const Gap(30),
            Obx(() => leaveController.loading.isTrue
                ? Center(child: const AppLoader())
                : AppButton(
                    title: 'SUBMIT',
                    onTap: () {
                      leaveRequest();
                    },
                  ))
          ],
        ),
      ),
    );
  }

  // first check all data is filled, from date is before to date, and days is a valid number after that call leave request api in authcontroller
// if leave request is successful, show a success message and pop the screen
  // if leave request fails, show an error message
  // if any validation fails, show an error message

  void leaveRequest() async {
    // Implement leave request logic here
    if (leaveType == null ||
        fromDate.text.isEmpty ||
        toDate.text.isEmpty ||
        days.text.isEmpty) {
      // Show error message for missing fields
      AppSnackBar.showSnackBar('Please fill all fields');
      return;
    }
    if (DateTime.parse(fromDate.text).isAfter(DateTime.parse(toDate.text))) {
      // Show error message for invalid date range
      AppSnackBar.showSnackBar('From date must be before To date');
      return;
    }
    if (int.tryParse(days.text) == null || int.parse(days.text) <= 0) {
      // Show error message for invalid number of days
      AppSnackBar.showSnackBar('Please enter a valid number of days');
      return;
    }
    // Call the leave request API here
    var user = Get.find<UserController>().user;
    await leaveController.createLeaveRequest(
        empId: user!.eId!,
        leaveType: leaveType ?? "",
        purpose: purpose.text,
        leaveDays: days.text,
        fromDate: "${fromDate.text} 12:00:00", // Adding time to date
        toDate: "${toDate.text} 12:00:00"); // Adding time to date
    if (leaveController.createLeaveSuccess.value) {
      AppSnackBar.showSnackBar('Leave request created successfully');
      clearForm();
      // Pop the screen after successful leave request
      context.pop();
    } else {
      AppSnackBar.showSnackBar(
          leaveController.errorMessage ?? 'Failed to create leave request');
    }
  }

  void clearForm() {
    setState(() {
      leaveType = null;
      fromDate.clear();
      toDate.clear();
      days.clear();
      purpose.clear();
    });
  }
}

import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../widgets/top_app_bar.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  String? _selectedOption;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
    );

    if (pickedDate != null) {
      setState(() {
        // dateController.text = "${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}";
      });
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
            Text("Leave Information in Days"),
            Gap(20),
            Text("Leave Type"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: 'yes',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
                const Text('Casual'),
                Gap(10),
                Radio<String>(
                  value: 'no',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
                const Text('Sick'),
                Gap(10),
                Radio<String>(
                  value: 'no',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
                const Text('Privilege')
              ],
            ),
            Gap(10),
            Text("From date"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "", suffixIcon: Icon(Icons.calendar_month)),
                    readOnly: true,
                    enabled: false,
                  ),
                )),
                Gap(10),
                Expanded(
                    child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("Half")
                  ],
                ))
              ],
            ),
            Gap(10),
            Text("To date"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "", suffixIcon: Icon(Icons.calendar_month)),
                    readOnly: true,
                    enabled: false,
                  ),
                )),
                Gap(10),
                Expanded(
                    child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("Half")
                  ],
                ))
              ],
            ),
            Gap(10),
            Text("Total number of days"),
            TextField(),
            Gap(10),
            Text("Purpose"),
            TextField(
              minLines: 5,
              maxLines: 10,
            ),
            Gap(30),
            AppButton(
              title: 'SUBMIT',
              onTap: () {
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

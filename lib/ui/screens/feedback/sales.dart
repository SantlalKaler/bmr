import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../elements/app_button.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsetsGeometry.all(DimensConstants.screenPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Avg Stocking",
            ),
          ),
          Gap(10),
          TextField(
            decoration: InputDecoration(
              hintText: "Current Feed Used",
            ),
          ),
          Gap(10),
          Text("Current Expereience"),
          Row(
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
              const Text('Positive'),
              Gap(10),
            ],
          ),
          Gap(10),
          Row(
            children: [
              Radio(
                value: 'no',
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              const Text('Negative'),
            ],
          ),
          Gap(10),
          Text("Would you like to change"),
          Row(
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
              const Text('Yes'),
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
              const Text('No'),
            ],
          ),
          Gap(10),
          TextField(
            decoration: InputDecoration(
              hintText: "What do you expect",
            ),
          ),
          Gap(10),
          TextField(
            decoration: InputDecoration(
              hintText: "Comments",
            ),
          ),
          Gap(40),
          AppButton(
            title: "Submit",
            onTap: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}

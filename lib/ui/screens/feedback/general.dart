import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../elements/app_button.dart';

class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
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
              hintText: "No. of Action Ponds",
            ),
          ),
          Gap(10),
          Text("BMR Feed"),
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
              hintText: "Feed Brand",
            ),
          ),
          Gap(10),
          TextField(
            decoration: InputDecoration(
              hintText: "Current Culture",
            ),
          ),
          Gap(10),
          TextField(
            decoration: InputDecoration(
              hintText: "When you are planning to stock",
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

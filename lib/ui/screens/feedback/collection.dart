import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../elements/app_button.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
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
              hintText: "Amount Due",
            ),
          ),
          Gap(10),
          TextField(
            decoration: InputDecoration(
              hintText: "When can you pay?",
            ),
          ),
          Gap(10),
          Text("Cash or Material"),
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
              const Text('Cash'),
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
              const Text('Material'),
            ],
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

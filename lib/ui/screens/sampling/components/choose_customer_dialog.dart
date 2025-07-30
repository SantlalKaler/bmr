import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChooseCustomerDialog extends StatefulWidget {
  const ChooseCustomerDialog({super.key});

  @override
  State<ChooseCustomerDialog> createState() => _ChooseCustomerDialogState();
}

class _ChooseCustomerDialogState extends State<ChooseCustomerDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsGeometry.all(DimensConstants.screenPadding),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Customer",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.search_rounded),
              Gap(10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Search here"),
                ),
              )
            ],
          ),
          Gap(20),
          Expanded(
              child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Xa Kaler \nJhunjhunu, Rajasthan"),
                  Gap(10),
                  Divider()
                ],
              );
            },
          ))
        ],
      ),
    );
  }
}

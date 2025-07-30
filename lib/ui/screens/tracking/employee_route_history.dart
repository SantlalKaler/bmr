import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';

class EmployeeRouteHistory extends StatefulWidget {
  const EmployeeRouteHistory({super.key});

  @override
  State<EmployeeRouteHistory> createState() => _EmployeeRouteHistoryState();
}

class _EmployeeRouteHistoryState extends State<EmployeeRouteHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Employee Route History",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(DimensConstants.screenPadding),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Select Customer Name",
                      suffixIcon: Icon(Icons.search_rounded),
                    ),
                  ),
                ]),
          ),
        ));
  }
}

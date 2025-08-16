import 'package:bmr/controllers/employee_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeRouteHistory extends StatefulWidget {
  const EmployeeRouteHistory({super.key, required this.regionId});
  final String regionId;

  @override
  State<EmployeeRouteHistory> createState() => _EmployeeRouteHistoryState();
}

class _EmployeeRouteHistoryState extends State<EmployeeRouteHistory> {
  EmployeeController employeeController = Get.find();

  @override
  void initState() {
    super.initState();
    if (widget.regionId != null && widget.regionId.isNotEmpty) {
      employeeController.regionBasedEmployeeList(widget.regionId);
    }
  }

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

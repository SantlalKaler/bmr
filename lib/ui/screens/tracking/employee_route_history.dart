import 'package:bmr/controllers/employee_controller.dart';
import 'package:bmr/data/model/RegionBasedEmployee.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_button.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../elements/app_loader.dart';
import '../../theme_light.dart';

class EmployeeRouteHistory extends StatefulWidget {
  const EmployeeRouteHistory({super.key, required this.regionId});
  final String regionId;

  @override
  State<EmployeeRouteHistory> createState() => _EmployeeRouteHistoryState();
}

class _EmployeeRouteHistoryState extends State<EmployeeRouteHistory> {
  showLocationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Do you want to see?"),
          content: Row(
            children: [
              AppButton(title: "Route History", onTap: () {}),
              AppButton(title: "Current Location", onTap: () {})
            ],
          ),
        );
      },
    );
  }

  EmployeeController employeeController = Get.find();
  EmployeeController customerController = Get.find();

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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Select Customer Name",
                      suffixIcon: Icon(Icons.search_rounded),
                    ),
                  ),
                  Obx(() => employeeController.loading.isTrue
                      ? const Center(child: AppLoader())
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsetsGeometry.all(
                              DimensConstants.screenPadding),
                          itemCount:
                              employeeController.regionBasedEmployees.length,
                          itemBuilder: (context, index) {
                            RegionBasedEmployee employee =
                                employeeController.regionBasedEmployees[index];
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Do you want to see?"),
                                    actions: [
                                      AppButton(
                                          title: "Route History",
                                          onTap: () {
                                            context.push(AppPath.mapView,
                                                extra: false);
                                          }),
                                      AppButton(
                                          title: "Current Location",
                                          onTap: () {
                                            context.push(AppPath.mapView,
                                                extra: true);
                                          })
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                padding: const EdgeInsetsGeometry.all(10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(employee.empName ?? "")),
                                      Icon(
                                        Icons.arrow_circle_right,
                                        size: 30,
                                        color: primaryColor,
                                      )
                                    ]),
                              ),
                            );
                          },
                        ))
                ]),
          ),
        ));
  }
}

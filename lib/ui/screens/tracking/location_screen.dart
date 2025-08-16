import 'package:bmr/controllers/custom_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../data/model/Zone.dart';
import '../widgets/top_app_bar.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  CustomController customController = Get.find();

  @override
  void initState() {
    super.initState();
    customController.getRegionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 120),
        child: TopAppBar(
          title: "Regions",
        ),
      ),
      body: Obx(() => customController.loading.isTrue
          ? Center(child: AppLoader())
          : ListView.builder(
              padding: EdgeInsetsGeometry.all(DimensConstants.screenPadding),
              itemCount: customController.customerZoneList.length,
              itemBuilder: (context, index) {
                Zone zone = customController.customerZoneList[index];
                return GestureDetector(
                  onTap: () {
                    context.push(AppPath.employeeRouteHistory,
                        extra: zone.id ?? "");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      padding: const EdgeInsetsGeometry.all(10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text(zone.zoneName ?? "")),
                            Icon(
                              Icons.arrow_circle_right,
                              size: 30,
                              color: primaryColor,
                            )
                          ]),
                    ),
                  ),
                );
              },
            )),
    );
  }
}

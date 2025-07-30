import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/top_app_bar.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
      body: ListView.builder(
        padding: EdgeInsetsGeometry.all(DimensConstants.screenPadding),
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.push(AppPath.employeeRouteHistory);
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
                      const Expanded(child: Text("Ap-01")),
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
      ),
    );
  }
}

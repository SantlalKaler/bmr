import 'package:bmr/controllers/pond_controller.dart';
import 'package:bmr/data/model/pond_sampling.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../elements/vertical_line.dart';
import '../../routes/mobile_routes.dart';
import '../../theme_light.dart';

class SingleHarvestingItem extends StatefulWidget {
  final PondSampling pondSampling;
  final String custId;
  const SingleHarvestingItem(
      {super.key, required this.pondSampling, required this.custId});

  @override
  State<SingleHarvestingItem> createState() => _SingleHarvestingItemState();
}

class _SingleHarvestingItemState extends State<SingleHarvestingItem> {
  PondController pondController = Get.find();
  @override
  Widget build(BuildContext context) {
    PondSampling pondSample = widget.pondSampling;
    return Padding(
      padding: const EdgeInsetsGeometry.all(10),
      child: Container(
        padding: const EdgeInsetsGeometry.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pondSample.pondId ?? ""),
            Gap(20),
            Text("WSA(Acres): ${pondSample.wsa}"),
            Gap(10),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        context.push(AppPath.pondDetails, extra: {
                          "pondId": pondSample.id,
                          "cycleId": pondSample.cycleId
                        });
                      },
                      child: Text(
                        "Pond\nDetails",
                        style: TextStyle(color: primaryColorDark),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  VerticalLine(
                    height: double.infinity,
                    width: 0.5,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      var data = {
                        "custId": widget.custId,
                        "pondId": pondSample.id,
                        "cycleId": pondSample.cycleId,
                        "request": "1"
                      };
                      context.push(AppPath.historyHarvest, extra: data);
                    },
                    child: Text(
                      "History",
                      style: TextStyle(color: primaryColorDark),
                      textAlign: TextAlign.center,
                    ),
                  )),
                  VerticalLine(
                    height: double.infinity,
                    width: 0.5,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      pondController.selectedPondSampling = pondSample;
                      var data = {
                        "custId": widget.custId,
                        "pondId": pondSample.id,
                        "cycleId": pondSample.cycleId
                      };
                      context.push(AppPath.enterHarvest, extra: data);
                    },
                    child: Text(
                      "Enter\nHarvest",
                      style: TextStyle(color: primaryColorLight),
                      textAlign: TextAlign.center,
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

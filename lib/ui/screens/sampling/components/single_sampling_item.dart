import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../elements/vertical_line.dart';
import '../../../routes/mobile_routes.dart';
import '../../../theme_light.dart';

class SingleSamplingItem extends StatefulWidget {
  const SingleSamplingItem({super.key});

  @override
  State<SingleSamplingItem> createState() => _SingleSamplingItemState();
}

class _SingleSamplingItemState extends State<SingleSamplingItem> {
  @override
  Widget build(BuildContext context) {
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
            const Text("pond_pond1"),
            Gap(20),
            Text("WSA(Acres): 40"),
            Gap(10),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    "Pond Details",
                    style: TextStyle(color: primaryColorDark),
                    textAlign: TextAlign.center,
                  )),
                  VerticalLine(
                    height: double.infinity,
                    width: 0.5,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      context.push(AppPath.historySampling);
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
                      context.push(AppPath.createSampling);
                    },
                    child: Text(
                      "Enter Sampling",
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

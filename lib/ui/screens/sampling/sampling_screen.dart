import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../elements/vertical_line.dart';

class SamplingScreen extends StatefulWidget {
  const SamplingScreen({super.key});

  @override
  State<SamplingScreen> createState() => _SamplingScreenState();
}

class _SamplingScreenState extends State<SamplingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Samping",
          )),
      body: Padding(
        padding: EdgeInsets.all(DimensConstants.screenPadding),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: "Customer Name",
              ),
            ),
            const Gap(10),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsetsGeometry.all(10),
                    child: Container(
                      padding: const EdgeInsetsGeometry.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("pond_pond1"),
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
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

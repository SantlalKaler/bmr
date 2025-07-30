import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../routes/mobile_routes.dart';

class PondScreen extends StatefulWidget {
  const PondScreen({super.key});

  @override
  State<PondScreen> createState() => _PondScreenState();
}

class _PondScreenState extends State<PondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Pond List",
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
                  return GestureDetector(
                    onTap: () {
                      context.push(AppPath.pondDetails);
                    },
                    child: Padding(
                      padding: const EdgeInsetsGeometry.all(10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Container(
                              height: double.infinity,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: primaryColorDark,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                            ),
                            Gap(20),
                            const Text("Pond_pond01")
                          ],
                        ),
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

import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PondDetailsScreen extends StatefulWidget {
  const PondDetailsScreen({super.key});

  @override
  State<PondDetailsScreen> createState() => _PondDetailsScreenState();
}

class _PondDetailsScreenState extends State<PondDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "pond_test_01",
          )),
      body: Padding(
        padding: EdgeInsets.all(DimensConstants.screenPadding),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(DimensConstants.screenPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        "Wsa(Acres",
                      )),
                      Expanded(
                          child: Text(
                        "1",
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ))
                    ],
                  ),
                );
              },
            )),
            Gap(20),
            ElevatedButton(
                onPressed: () {
                  context.push(AppPath.technicalQuries);
                },
                child: Text("Technical Quries")),
            Gap(15),
            ElevatedButton(onPressed: () {}, child: Text("Edit Pond Details"))
          ],
        ),
      ),
    );
  }
}

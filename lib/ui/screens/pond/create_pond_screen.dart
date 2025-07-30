import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../theme_light.dart';
import '../widgets/top_app_bar.dart';

class CreatePondScreen extends StatefulWidget {
  const CreatePondScreen({super.key});

  @override
  State<CreatePondScreen> createState() => _CreatePondScreenState();
}

class _CreatePondScreenState extends State<CreatePondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Create Pond",
          )),
      body: Padding(
        padding: EdgeInsetsGeometry.all(DimensConstants.screenPadding),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: "Customer Name",
              ),
            ),
            const Gap(10),
            TextField(
              decoration: const InputDecoration(
                hintText: "Pond Name",
              ),
            ),
            Gap(10),
            TextField(
              decoration: const InputDecoration(
                hintText: "WSA(In Acres)",
              ),
            ),
            Gap(10),
            TextField(
              decoration: const InputDecoration(
                hintText: "Comments",
              ),
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Active"),
                  ),
                ),
                Gap(DimensConstants.spaceBetweenViewsAndSubViews),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Inactive"),
                  ),
                ),
              ],
            ),
            Gap(50),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text("Create Pond"),
            ),
          ],
        ),
      ),
    );
  }
}

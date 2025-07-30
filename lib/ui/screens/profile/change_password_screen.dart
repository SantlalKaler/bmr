import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_button.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Text(
            "Note : Your password must contains 6 Characters at least 1 alphabet, 1 number and 1 special character"),
      ),
      backgroundColor: scaffoldBackgroundColor,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Change Password",
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(DimensConstants.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Xa Kaler",
              ),
              readOnly: true,
            ),
            Gap(10),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Current Password",
              ),
              readOnly: true,
            ),
            Gap(10),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter New Password",
              ),
              readOnly: true,
            ),
            Gap(50),
            AppButton(
                title: "CHANGE",
                onTap: () {
                  context.pop();
                })
          ],
        ),
      ),
    );
  }
}

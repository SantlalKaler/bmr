import 'package:bmr/controllers/auth_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../constants/image_constants.dart';
import '../../routes/mobile_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.find();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void showResetDialog() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController resetUsername = TextEditingController();
        TextEditingController resetPassword = TextEditingController();

        return AlertDialog(
          title: const Text("Reset Session"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: resetUsername,
                decoration: const InputDecoration(
                  hintText: "Username",
                ),
              ),
              const Gap(10),
              TextField(
                controller: resetPassword,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child:
                  const Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                if (resetUsername.text.isEmpty || resetPassword.text.isEmpty) {
                  Fluttertoast.showToast(
                    msg: "Username or Password cannot be empty",
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                } else {
                  // You can put your reset logic here
                  Get.back(); // Close the dialog
                }
              },
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child:
                  const Text("Submit", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void handleLogin() {
    if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Username or Password cannot be empty",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } else {
      context.pushReplacement(AppPath.homePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: DimensConstants.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstants.logo,
              // height: 130,
            ),
            Gap(DimensConstants.extraHighSpacing),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              controller: userNameController,
            ),
            Gap(DimensConstants.spaceBetweenViews),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              controller: passwordController,
            ),
            Gap(DimensConstants.spaceBetweenViews),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                      value: authController.rememberMe.value,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10)),
                      onChanged: (value) {
                        authController.rememberMe.value =
                            !authController.rememberMe.value;
                      }),
                ),
                Gap(DimensConstants.spaceBetweenViews),
                const Text("Remember Me")
              ],
            ),
            Gap(DimensConstants.spaceBetweenViews),
            ElevatedButton(
              onPressed: handleLogin,
              child: const Text("Login"),
            ),
            Gap(DimensConstants.spaceBetweenViewsAndSubViews),
            OutlinedButton(
              onPressed: showResetDialog,
              child: const Text("Reset Session"),
            ),
          ],
        ),
      ),
    );
  }
}

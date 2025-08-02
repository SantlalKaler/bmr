import 'package:bmr/controllers/auth_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/constants/strings_constants.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../constants/image_constants.dart';
import '../../elements/app_loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.find();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void showResetDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Reset Session"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: userNameController,
                decoration: const InputDecoration(
                  hintText: "Username",
                ),
              ),
              const Gap(10),
              TextField(
                controller: passwordController,
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
            Obx(
              () => TextButton(
                onPressed: () async {
                  if (userNameController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "Username or Password cannot be empty",
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  } else {
                    await authController.resetEmployeeSession(
                        userNameController.text, passwordController.text);
                    if (authController.resetSessionSuccess.isTrue) {
                      Fluttertoast.showToast(
                        msg: "Session reset successfully",
                      );
                      if (context.mounted) {
                        context.pop();
                      }
                    }
                  }
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                child: authController.dialogLoading.isTrue
                    ? const AppLoader(
                        color: Colors.white,
                      )
                    : const Text("Submit",
                        style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        );
      },
    );
  }

  void handleLogin() async {
    if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Username or Password cannot be empty",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } else {
      await authController.login(
          userNameController.text, passwordController.text);
      if (authController.loginSuccess.isTrue) {
        Fluttertoast.showToast(
          msg: "Logic Successfully",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        if (context.mounted) {
          context.pushReplacement(AppPath.homePath);
        }
      } else {
        Fluttertoast.showToast(
          msg:
              authController.errorMessage ?? StringConstants.somethingWentWrong,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: DimensConstants.screenPadding),
        child: SingleChildScrollView(
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
              Obx(
                () => ElevatedButton(
                  onPressed:
                      authController.loading.isFalse ? handleLogin : null,
                  child: authController.loading.isTrue
                      ? const AppLoader(
                          color: Colors.white,
                        )
                      : const Text("Login"),
                ),
              ),
              const Gap(20),
              OutlinedButton(
                onPressed: showResetDialog,
                child: const Text("Reset Session"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

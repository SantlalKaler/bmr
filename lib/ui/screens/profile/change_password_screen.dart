import 'package:bmr/controllers/auth_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_button.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/elements/app_snackbar.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  UserController userController = Get.find();
  AuthController authController = Get.find();
  // 2 text editing controllers for current and new password
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // set username controller text to userController.user.username
    usernameController.text = userController.user?.empName ?? "";
    return Scaffold(
      bottomSheet: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
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
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: "Enter Username",
              ),
            ),
            const Gap(10),
            TextField(
              obscureText: true,
              controller: currentPasswordController,
              decoration: const InputDecoration(
                hintText: "Enter Current Password",
              ),
            ),
            const Gap(10),
            TextField(
              obscureText: true,
              controller: newPasswordController,
              decoration: const InputDecoration(
                hintText: "Enter New Password",
              ),
            ),
            const Gap(50),
            Obx(() => authController.loading.isTrue
                ? const AppLoader()
                : AppButton(
                    title: "CHANGE",
                    onTap: () {
                      changePassword();
                    }))
          ],
        ),
      ),
    );
  }

  // create a change password function that first check new password contains 6 characters at least 1 alphabet, 1 number and 1 special character
  bool isValidPassword(String password) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
    );
    return passwordRegex.hasMatch(password);
  }

  // first check new password is valid, then call authController.changePassword with currentPasswordController.text and newPasswordController.text
  void changePassword() async {
    if (isValidPassword(newPasswordController.text)) {
      await authController.changePassword(
        username: usernameController.text,
        newPassword: "12345",
      );

      if (authController.changePasswordSuccess.value) {
        AppSnackBar.showSnackBar("Password changed successfully.");
        context.pop();
      } else {
        AppSnackBar.showSnackBar(
            authController.errorMessage ?? "Failed to change password.");
      }
    } else {
      AppSnackBar.showSnackBar(
          "New password must contain at least 6 characters, "
          "1 alphabet, 1 number and 1 special character.");
    }
  }
}

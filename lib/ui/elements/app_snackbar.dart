import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static showSnackBar(String? message, {String? title}) {
    return Get.snackbar(
        title ?? "Info", message ?? "Something went wrong. Try again!",
        snackPosition: SnackPosition.BOTTOM);
    /* ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text(message ?? "Something went wrong. Try again!")));*/
  }

  static showSnackBarWithButton(
      BuildContext context, String message, String buttonText, Function onTap,
      {String? title}) {
    Flushbar(
      title: title,
      message: message,
      mainButton: TextButton(
          onPressed: () {
            onTap();
          },
          child: Text(buttonText)),
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}

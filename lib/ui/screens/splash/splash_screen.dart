import 'dart:async';

import 'package:bmr/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../constants/image_constants.dart';
import '../../routes/mobile_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserController userController = Get.find();

  @override
  void initState() {
    moveToNext();
    super.initState();
  }

  moveToNext() {
    Timer(const Duration(milliseconds: 2000), () async {
      if (userController.user == null) {
        context.pushReplacement(AppPath.loginPath);
      } else {
        context.pushReplacement(AppPath.homePath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageConstants.logo,
          // height: 130,
        ),
      ),
    );
  }
}

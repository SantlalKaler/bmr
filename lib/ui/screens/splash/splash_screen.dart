import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/image_constants.dart';
import '../../routes/mobile_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    moveToNext();
    super.initState();
  }

  moveToNext() async {
    Timer(const Duration(milliseconds: 1000), () {
      GoRouter.of(context).pushReplacement(AppPath.loginPath);
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

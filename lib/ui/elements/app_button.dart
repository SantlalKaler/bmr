import 'package:flutter/material.dart';

import '../theme_light.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isLoading;

  const AppButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.backgroundColor,
      this.isLoading,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          backgroundColor: backgroundColor ?? primaryColor,
        ),
        child: Text(
          title,
          style: TextStyle(color: textColor ?? Colors.white),
        ));
  }
}

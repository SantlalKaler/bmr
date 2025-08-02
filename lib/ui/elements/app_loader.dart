import 'package:flutter/material.dart';

import '../theme_light.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: color ?? primaryColor,
        strokeWidth: 3,
      ),
    );
  }
}

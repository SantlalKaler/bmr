import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  VerticalLine({super.key, required this.height, required this.width});
  double width;
  double height;
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}

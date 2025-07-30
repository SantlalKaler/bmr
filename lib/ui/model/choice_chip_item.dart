import 'package:flutter/material.dart';

class ChoiceChipItem {
  final String title;
  final String? id;
  final Widget? icon;
  final String? imageUrl;
  final String? iconName;

  ChoiceChipItem(
      {required this.title, this.icon, this.id, this.iconName, this.imageUrl});
}

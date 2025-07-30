import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';

class HistoryHarvestScreen extends StatefulWidget {
  const HistoryHarvestScreen({super.key});

  @override
  State<HistoryHarvestScreen> createState() => _HistoryHarvestScreenState();
}

class _HistoryHarvestScreenState extends State<HistoryHarvestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Harvest History",
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("No History Found.")],
        ));
  }
}

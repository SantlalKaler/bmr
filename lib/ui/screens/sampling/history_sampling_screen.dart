import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';

class HistorySamplingScreen extends StatefulWidget {
  const HistorySamplingScreen({super.key});

  @override
  State<HistorySamplingScreen> createState() => _HistorySamplingScreenState();
}

class _HistorySamplingScreenState extends State<HistorySamplingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Sampling History",
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("No History Found.")],
        ));
  }
}

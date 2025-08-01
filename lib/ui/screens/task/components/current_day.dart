import 'package:bmr/ui/screens/task/components/single_task.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CurrentDay extends StatefulWidget {
  const CurrentDay({super.key});

  @override
  State<CurrentDay> createState() => _CurrentDayState();
}

class _CurrentDayState extends State<CurrentDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(10),
        const Center(
          child: Text("21-Jun-2025"),
        ),
        const Gap(10),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 20),
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: SingleTask(),
              );
            },
          ),
        ),
      ],
    );
  }
}

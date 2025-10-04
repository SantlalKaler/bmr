import 'package:bmr/ui/screens/task/components/single_task.dart';
import 'package:bmr/utils/date_converter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/model/task.dart';

class CurrentDay extends StatefulWidget {
  List<Task> taskList;
  CurrentDay({super.key, required this.taskList});

  @override
  State<CurrentDay> createState() => _CurrentDayState();
}

class _CurrentDayState extends State<CurrentDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(10),
        Center(
          child: Text(
              DateConverter.convertDate(DateTime.now(), format: "dd-MMM-yyyy")),
        ),
        const Gap(10),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 20),
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: widget.taskList.length,
            itemBuilder: (context, index) {
              var task = widget.taskList[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: SingleTask(task: task),
              );
            },
          ),
        ),
      ],
    );
  }
}

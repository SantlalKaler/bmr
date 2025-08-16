import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/model/task.dart';

class SingleTaskHistory extends StatefulWidget {
  const SingleTaskHistory({super.key, required this.task});
  final Task task;

  @override
  State<SingleTaskHistory> createState() => _SingleTaskHistoryState();
}

class _SingleTaskHistoryState extends State<SingleTaskHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.supervised_user_circle_outlined,
                    color: primaryColorDark,
                  ),
                  Gap(15),
                  Text(
                    widget.task.empName ?? "",
                    style: TextStyle(
                        color: primaryColorDark, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text(
                widget.task.createdDate ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.task.approvedStatus.toString() == "0"
                    ? "Pending"
                    : "Approved",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              // Text(
              //   "General",
              //   style: Theme.of(context).textTheme.bodySmall,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

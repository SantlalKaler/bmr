import 'package:bmr/ui/screens/current_day_task/components/visit_details_dialog.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SingleTaskHistory extends StatefulWidget {
  const SingleTaskHistory({super.key});

  @override
  State<SingleTaskHistory> createState() => _SingleTaskHistoryState();
}

class _SingleTaskHistoryState extends State<SingleTaskHistory> {
  bool _showDetails = true;

  void showVisitDetailsDialogs(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const VisitDetailsDialog(),
      ),
    );
  }

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
                    "Xa Kaler",
                    style: TextStyle(
                        color: primaryColorDark, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text(
                "21 Jan 05:02 PM",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Approved",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "General",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

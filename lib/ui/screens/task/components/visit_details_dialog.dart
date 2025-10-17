import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/image_constants.dart';
import '../../../theme_light.dart';

class VisitDetailsDialog extends StatefulWidget {
  final String customerId;
  const VisitDetailsDialog({super.key, required this.customerId});

  @override
  State<VisitDetailsDialog> createState() => _VisitDetailsDialogState();
}

class _VisitDetailsDialogState extends State<VisitDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> visitDetailsTiles = [
      {
        'title': 'Sampling',
        'color': Colors.orangeAccent,
        'onTap': () {
          context.push(AppPath.sampling, extra: widget.customerId);
        },
        'icon': ImageConstants.sampling, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
      {
        'title': 'Harvest',
        'color': Colors.teal,
        'onTap': () {
          context.push(AppPath.harvest, extra: widget.customerId);
        },
        'icon': ImageConstants.harvest, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
      {
        'title': 'Technical',
        'color': Colors.black,
        'onTap': () {
          context.push(AppPath.pondList);
        },
        'icon': ImageConstants.technical, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
      {
        'title': 'Feedback',
        'color': Colors.brown,
        'onTap': () {
          context.push(AppPath.feedback);
        },
        'icon': ImageConstants.profile, // 🔍 Replace with appropriate icon
        'comment': 'Report Icon'
      },
    ];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: scaffoldBackgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(DimensConstants.screenPadding),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Theme.of(context).primaryColor,
                  primaryColorDark,
                  Theme.of(context).primaryColor,
                ],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const Gap(20),
                const Text("Visit Details",
                    style: TextStyle(color: Colors.white, fontSize: 18))
              ],
            ),
          ),
          for (var item in visitDetailsTiles)
            GestureDetector(
              onTap: item['onTap'],
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: item['color'],
                            borderRadius: BorderRadius.circular(100)),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          item['icon'],
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                      ),
                      const Gap(15),
                      Text(item['title'])
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

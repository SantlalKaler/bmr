import 'package:bmr/ui/screens/current_day_task/components/visit_details_dialog.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SingleTask extends StatefulWidget {
  const SingleTask({super.key});

  @override
  State<SingleTask> createState() => _SingleTaskState();
}

class _SingleTaskState extends State<SingleTask> {
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
    return GestureDetector(
      onTap: () {
        setState(() {
          _showDetails = !_showDetails;
        });
      },
      child: Container(
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
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 20,
                      color: primaryColor,
                    ))
              ],
            ),

            /// Animated Section
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chennai, Chennai, Chennai, Tamilnadu",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(20),
                    Text(
                      "Created By: Amanudeen",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: null,
                            child: Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
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
                                child: const Text(
                                  "CheckIn",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showVisitDetailsDialogs(context);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white70),
                                child: Text(
                                  "Visit Details",
                                  style: TextStyle(color: Colors.grey.shade400),
                                )),
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Comments: Meet the director",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState: _showDetails
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}

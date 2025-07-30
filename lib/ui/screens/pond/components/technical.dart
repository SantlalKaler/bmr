import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/screens/pond/components/technical_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class Technical extends StatefulWidget {
  const Technical({super.key});

  @override
  State<Technical> createState() => _TechnicalState();
}

class _TechnicalState extends State<Technical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(DimensConstants.screenPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  "Water Source",
                )),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: '',
                    ),
                  ),
                )
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  "Pumping",
                )),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: '',
                    ),
                  ),
                )
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  "Treatment",
                )),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: '',
                    ),
                  ),
                )
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  "Check Tray Feed Qty",
                )),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Values in decimal',
                    ),
                  ),
                )
              ],
            ),
            Gap(10),
            TechnicalRadioButton(
              title: "Sedimentation Tank",
            ),
            Gap(10),
            TechnicalRadioButton(
              title: "Pre Treatment Available",
            ),
            Gap(10),
            TechnicalRadioButton(
              title: "Fencing and Disinfectants",
            ),
            Gap(10),
            TechnicalRadioButton(
              title: "Applied any Fermentation",
            ),
            Gap(10),
            TechnicalRadioButton(
              title: "Probiotic Supplimentation",
            ),
            Gap(10),
            TechnicalRadioButton(
              title: "Aerators Chlorination after Crap",
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  "Comments",
                )),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: '',
                    ),
                  ),
                )
              ],
            ),
            Gap(20),
            ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}

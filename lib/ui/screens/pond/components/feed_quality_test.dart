import 'package:bmr/controllers/feedback_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/elements/app_snackbar.dart';
import 'package:bmr/ui/screens/pond/components/technical_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../controllers/customer_controller.dart';

class FeedQualityTest extends StatefulWidget {
  const FeedQualityTest({super.key});

  @override
  State<FeedQualityTest> createState() => _FeedQualityTestState();
}

class _FeedQualityTestState extends State<FeedQualityTest> {
  // create text editing controllers for each TextField
  final TextEditingController fcrController = TextEditingController();
  final TextEditingController feedSinkingTimeController =
      TextEditingController();
  final TextEditingController commentsController = TextEditingController();

  FeedbackController feedbackController = Get.find();

  // store yes no values
  String powderHG = "";
  String hg3S = "";
  String pride3P = "";
  String moldsInfection = "";
  String fibrous = "";
  String stichingProblem = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(DimensConstants.screenPadding),
        child: Column(
          children: [
            TechnicalRadioButton(
              title: "Powder HG 1 & 2",
              onChanged: (String value) {
                powderHG = value;
              },
            ),
            const Gap(10),
            TechnicalRadioButton(
              title: "HG 3S, 3P, 4S, 4&5",
              onChanged: (String value) {
                hg3S = value;
              },
            ),
            const Gap(10),
            TechnicalRadioButton(
              title: "Pride 3P, 4S&4",
              onChanged: (String value) {
                pride3P = value;
              },
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    child: Text(
                  "FCR",
                )),
                Expanded(
                  child: TextField(
                    controller: fcrController,
                    decoration: const InputDecoration(
                      labelText: 'Fcr in ratio',
                    ),
                  ),
                )
              ],
            ),
            const Gap(10),
            TechnicalRadioButton(
              title: "Molds Infection",
              onChanged: (String value) {
                moldsInfection = value;
              },
            ),
            const Gap(10),
            TechnicalRadioButton(
              title: "Fibrous",
              onChanged: (String value) {
                fibrous = value;
              },
            ),
            const Gap(10),
            TechnicalRadioButton(
              title: "Stiching problem",
              onChanged: (String value) {
                stichingProblem = value;
              },
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    child: Text(
                  "Feed Sinking time",
                )),
                Expanded(
                  child: TextField(
                    controller: feedSinkingTimeController,
                    decoration: const InputDecoration(
                      labelText: 'Time in seconds',
                    ),
                  ),
                )
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    child: Text(
                  "Comments",
                )),
                Expanded(
                  child: TextField(
                    controller: commentsController,
                    decoration: const InputDecoration(
                      labelText: '',
                    ),
                  ),
                )
              ],
            ),
            const Gap(20),
            Obx(() => ElevatedButton(
                onPressed: () {
                  submitForm();
                },
                child: feedbackController.loading.isTrue
                    ? const AppLoader()
                    : const Text("Submit")))
          ],
        ),
      ),
    );
  }

  // first validate form use single if statement and check all fields are not empty

  submitForm() async {
    FeedbackController feedbackController = Get.find();
    CustomerController customerController = Get.find();
    UserController userController = Get.find();
    var userId = userController.user!.eId;
    await feedbackController.physicalTest(
      loginId: userId,
      datetime: DateTime.now().toIso8601String(),
      powderHg12: powderHG,
      hg3s3p4s45: hg3S,
      pride3p4s4: pride3P,
      fcr: fcrController.text.trim(),
      moldsInfection: moldsInfection,
      fibrous: fibrous,
      stitchingProblem: stichingProblem,
      feedSinkingTime: feedSinkingTimeController.text.trim(),
      comments: commentsController.text.trim(),
      farmerId: customerController.selectedCustomer?.id,
    );

    if (feedbackController.formSubmitSuccess.value) {
      // show success message
      AppSnackBar.showSnackBar("Data submitted successfully");
      clearForm();
    } else {
      // show error message
      AppSnackBar.showSnackBar(
        "Error: ${feedbackController.errorMessage ?? 'Something went wrong'}",
      );
    }
  }

  clearForm() {
    fcrController.clear();
    feedSinkingTimeController.clear();
    commentsController.clear();
    powderHG = "";
    hg3S = "";
    pride3P = "";
    moldsInfection = "";
    fibrous = "";
    stichingProblem = "";
    setState(() {});
  }
}

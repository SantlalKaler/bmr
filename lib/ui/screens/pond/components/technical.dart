import 'package:bmr/controllers/feedback_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/constants/strings_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/elements/app_snackbar.dart';
import 'package:bmr/ui/screens/pond/components/technical_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../controllers/customer_controller.dart';

class Technical extends StatefulWidget {
  const Technical({super.key});

  @override
  State<Technical> createState() => _TechnicalState();
}

class _TechnicalState extends State<Technical> {
  // create text editing controllers for each TextField
  final TextEditingController waterSourceController = TextEditingController();
  final TextEditingController pumpingController = TextEditingController();
  final TextEditingController treatmentController = TextEditingController();
  final TextEditingController trayFeedQtyController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();

  FeedbackController feedbackController = Get.find();

  // store yes no values in 0 and 1 format
  String sedimentationTank = "";
  String preTreatmentAvailable = "";
  String fencingAndDisinfectants = "";
  String appliedFermentation = "";
  String probioticSupplementation = "";
  String aeratorsChlorination = "";

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
                const Expanded(
                    child: Text(
                  "Water Source",
                )),
                Expanded(
                  child: TextField(
                    controller: waterSourceController,
                    decoration: const InputDecoration(
                      labelText: '',
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
                  "Pumping",
                )),
                Expanded(
                  child: TextField(
                    controller: pumpingController,
                    decoration: const InputDecoration(
                      labelText: '',
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
                  "Treatment",
                )),
                Expanded(
                  child: TextField(
                    controller: treatmentController,
                    decoration: const InputDecoration(
                      labelText: '',
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
                  "Check Tray Feed Qty",
                )),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: trayFeedQtyController,
                    decoration: const InputDecoration(
                      labelText: 'Values in decimal',
                    ),
                  ),
                )
              ],
            ),
            const Gap(10),
            TechnicalRadioButton(
              title: "Sedimentation Tank",
              onChanged: (String value) {
                sedimentationTank = value;
              },
            ),
            const Gap(10),
            TechnicalRadioButton(
              title: "Pre Treatment Available",
              onChanged: (String value) {
                preTreatmentAvailable = value;
              },
            ),
            const Gap(10),
            TechnicalRadioButton(
              title: "Fencing and Disinfectants",
              onChanged: (String value) {
                fencingAndDisinfectants = value;
              },
            ),
            const Gap(10),
            TechnicalRadioButton(
              title: "Applied any Fermentation",
              onChanged: (String value) {
                appliedFermentation = value;
              },
            ),
            const Gap(10),
            TechnicalRadioButton(
              title: "Probiotic Supplimentation",
              onChanged: (String value) {
                probioticSupplementation = value;
              },
            ),
            const Gap(10),
            TechnicalRadioButton(
              title: "Aerators Chlorination after Crap",
              onChanged: (String value) {
                aeratorsChlorination = value;
              },
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

  bool validateForm() {
    if (waterSourceController.text.isEmpty ||
        pumpingController.text.isEmpty ||
        treatmentController.text.isEmpty ||
        trayFeedQtyController.text.isEmpty ||
        commentsController.text.isEmpty) {
      return false;
    }
    return true;
  }

  submitForm() async {
    FeedbackController feedbackController = Get.find();
    CustomerController customerController = Get.find();
    UserController userController = Get.find();
    var userId = userController.user!.eId;
    await feedbackController.technicalTest(
      loginId: StringConstants.testUserId,
      farmerId: customerController.selectedCustomer?.id,
      datetime: DateTime.now().toIso8601String(),
      waterSources: waterSourceController.text,
      pumping: pumpingController.text,
      treatment: treatmentController.text,
      checkTrayFeedQty: trayFeedQtyController.text,
      sedimentationTank: sedimentationTank.toString(),
      preTreatmentAvailable: preTreatmentAvailable.toString(),
      fencingAndDisinfectants: fencingAndDisinfectants.toString(),
      appliedAnyFermentation: appliedFermentation.toString(),
      probioticSupplementation: probioticSupplementation.toString(),
      aeratorsChlorinationAfterCrap: aeratorsChlorination.toString(),
      comments: commentsController.text,
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
    waterSourceController.clear();
    pumpingController.clear();
    treatmentController.clear();
    trayFeedQtyController.clear();
    commentsController.clear();
    sedimentationTank = "";
    preTreatmentAvailable = "";
    fencingAndDisinfectants = "";
    appliedFermentation = "";
    probioticSupplementation = "";
    aeratorsChlorination = "";
    setState(() {});
  }
}

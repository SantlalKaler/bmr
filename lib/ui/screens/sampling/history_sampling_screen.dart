import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/sampling_controller.dart';

class HistorySamplingScreen extends StatefulWidget {
  const HistorySamplingScreen({super.key});

  @override
  State<HistorySamplingScreen> createState() => _HistorySamplingScreenState();
}

class _HistorySamplingScreenState extends State<HistorySamplingScreen> {
  SamplingController samplingController = Get.find();

  @override
  void initState() {
    super.initState();
    samplingController.getSampleHistory(
        custId: "", cycleId: "", pondId: "", request: "");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SamplingController(),
        builder: (controller) {
          return Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size(double.infinity, 120),
                child: TopAppBar(
                  title: "Sampling History",
                ),
              ),
              body: Obx(() => controller.loading.isTrue
                  ? const AppLoader()
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text("No History Found.")],
                    )));
        });
  }
}

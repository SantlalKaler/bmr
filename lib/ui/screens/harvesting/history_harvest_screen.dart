import 'package:bmr/ui/constants/constant.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/sampling_controller.dart';

class HistoryHarvestScreen extends StatefulWidget {
  final String custId;
  final String cycleId;
  final String pondId;
  final String request;
  const HistoryHarvestScreen(
      {super.key,
      required this.custId,
      required this.cycleId,
      required this.pondId,
      required this.request});

  @override
  State<HistoryHarvestScreen> createState() => _HistoryHarvestScreenState();
}

class _HistoryHarvestScreenState extends State<HistoryHarvestScreen> {
  SamplingController samplingController = Get.find();

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    samplingController.getSampleHistory(
        custId: widget.custId,
        cycleId: widget.cycleId,
        pondId: widget.pondId,
        request: widget.request);
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
                  title: "Harvest History",
                ),
              ),
              body: Obx(() => controller.loading.isTrue
                  ? const Center(child: AppLoader())
                  : controller.sampleHistory.isEmpty
                      ? const Center(
                          child: Text("No Data found"),
                        )
                      : ListView.builder(
                          padding: const EdgeInsetsGeometry.all(10),
                          itemCount: controller.sampleHistory.length,
                          itemBuilder: (context, index) {
                            var sample = controller.sampleHistory[index];

                            var details = {
                              "WSA": sample.adg ?? "",
                              "Seeds(in Million)": sample.seedStocking ?? "",
                              "Daily Feed": sample.dailyFeed ?? "",
                              "Total Feed": sample.totalFeed ?? "",
                              "Harvest Quantity": sample.harvestQuantity ?? "",
                              "Average Boyd Weight(in gms)": sample.adg ?? "",
                              "Average Daily Growth(g)": sample.adg ?? "",
                              "Seed Source": sample.seedSource ?? "",
                              "PH": sample.ph ?? "",
                              "Salinity(ppt)": sample.salinity ?? "",
                              "Actual Biomass(kgs)": sample.aBiomass ?? "",
                              "Expected Biomass(kgs)": sample.eBiomass ?? "",
                              "Survival": sample.survival ?? "",
                              "FCR": sample.fcr ?? "",
                              "Productivity": sample.productivity ?? "",
                              "Density": sample.density ?? "",
                            };
                            final entries = details.entries.toList();
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        // 1️⃣ DOC text
                                        Expanded(
                                          flex: 2,
                                          child: Text("DOC: ${sample.doc}"),
                                        ),

                                        // 2️⃣ Date with icon
                                        Expanded(
                                          flex: 3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(Icons.calendar_month,
                                                  size: 20),
                                              const SizedBox(width: 4),
                                              Flexible(
                                                child: Text(
                                                  sample.recordedDate ?? "",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // 3️⃣ Arrow container (no Expanded)
                                        InkWell(
                                          onTap: () {
                                            Constant.printValue("button click");
                                            setState(() {
                                              isExpanded = !isExpanded;
                                            });
                                          },
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            height: 25,
                                            width: 25,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Icon(
                                              isExpanded
                                                  ? Icons.keyboard_arrow_down
                                                  : Icons.keyboard_arrow_right,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AnimatedCrossFade(
                                      firstChild: const SizedBox.shrink(),
                                      secondChild: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 4, right: 4),
                                        child: ListView.builder(
                                          itemCount: entries.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            final key = entries[index].key;
                                            final value =
                                                entries[index].value.toString();
                                            return Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    key ?? "",
                                                  )),
                                                  Expanded(
                                                      child: Text(
                                                    value ?? "",
                                                    textAlign: TextAlign.end,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                  ))
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      crossFadeState: isExpanded
                                          ? CrossFadeState.showSecond
                                          : CrossFadeState.showFirst,
                                      duration:
                                          const Duration(milliseconds: 250),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )));
        });
  }
}

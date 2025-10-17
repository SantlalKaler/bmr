import 'package:bmr/controllers/pond_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PondDetailsScreen extends StatefulWidget {
  final String? cycleId;
  final String? pondId;

  const PondDetailsScreen(
      {super.key, required this.pondId, required this.cycleId});

  @override
  State<PondDetailsScreen> createState() => _PondDetailsScreenState();
}

class _PondDetailsScreenState extends State<PondDetailsScreen> {
  PondController pondController = Get.find();

  @override
  void initState() {
    super.initState();
    pondController.getPondDetails(
        cycleId: widget.cycleId!, pondId: widget.pondId!);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PondController(),
      builder: (controller) {
        var pond = controller.pond;
        var pondDetails = {
          "Wsa(Acres)": pond?.wsa ?? "",
          "Comment": pond?.comments ?? "",
          "Status": pond?.status ?? "",
          "Cycle Status": pond?.cycleStatus ?? "",
          "Stocking Date": pond?.stockingDate ?? "",
          "Recorder Date": pond?.recordedDate ?? "",
          "Seed Stocking(In Millions)": pond?.seedStocking ?? "",
        };
        final entries = pondDetails.entries.toList();
        return Scaffold(
          backgroundColor: scaffoldBackgroundColor,
          appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 120),
              child: TopAppBar(
                title: pond?.pondId ?? "Pond Details",
              )),
          body: Padding(
            padding: EdgeInsets.all(DimensConstants.screenPadding),
            child: controller.loading.isTrue
                ? const Center(child: AppLoader())
                : controller.pond == null
                    ? const Text("No pond details found")
                    : Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                            itemCount: entries.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final key = entries[index].key;
                              final value = entries[index].value.toString();
                              return Padding(
                                padding: EdgeInsets.all(
                                    DimensConstants.screenPadding),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(
                                      key ?? "",
                                    )),
                                    Expanded(
                                        child: Text(
                                      value ?? "",
                                      textAlign: TextAlign.end,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ))
                                  ],
                                ),
                              );
                            },
                          )),
                          // Gap(20),
                          // ElevatedButton(
                          //     onPressed: () {
                          //       context.push(AppPath.technicalQuries);
                          //     },
                          //     child: Text("Technical Quries")),
                          // Gap(15),
                          // ElevatedButton(onPressed: () {}, child: Text("Edit Pond Details"))
                        ],
                      ),
          ),
        );
      },
    );
  }
}

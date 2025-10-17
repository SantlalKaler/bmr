import 'dart:io';

import 'package:bmr/controllers/harvest_controller.dart';
import 'package:bmr/controllers/pond_controller.dart';
import 'package:bmr/controllers/task_controller.dart';
import 'package:bmr/data/pref_data.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/elements/app_snackbar.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../controllers/sampling_controller.dart';
import '../../model/choice_chip_item.dart';
import '../widgets/app_choice_chip.dart';

class CreateHarvestScreen extends StatefulWidget {
  final String custId;
  final String pondId;
  final String cycleId;
  const CreateHarvestScreen(
      {super.key,
      required this.custId,
      required this.pondId,
      required this.cycleId});

  @override
  State<CreateHarvestScreen> createState() => _CreateHarvestScreenState();
}

class _CreateHarvestScreenState extends State<CreateHarvestScreen> {
  List<ChoiceChipItem> fullPartialHarvest = [
    ChoiceChipItem(title: "Full Harvest"),
    ChoiceChipItem(title: "Partial Harvest"),
  ];
  SamplingController samplingController = Get.find();
  PondController pondController = Get.find();
  HarvesterController harvesterController = Get.find();
  int selectedHarvest = 1;
  TextEditingController wsa = TextEditingController();
  TextEditingController seeds = TextEditingController();
  TextEditingController stockDate = TextEditingController();
  TextEditingController harvestingDate = TextEditingController();
  TextEditingController previousSamplingDate = TextEditingController();
  TextEditingController doc = TextEditingController();
  TextEditingController dailyFeed = TextEditingController();
  TextEditingController totalFeed = TextEditingController();
  TextEditingController harvestQuantity = TextEditingController();
  TextEditingController abw = TextEditingController();
  TextEditingController adg = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController seedSource = TextEditingController();
  TextEditingController salinity = TextEditingController();
  TextEditingController actualBiomass = TextEditingController();
  TextEditingController expectedBiomass = TextEditingController();
  TextEditingController survival = TextEditingController();
  TextEditingController fcr = TextEditingController();
  TextEditingController productivity = TextEditingController();
  TextEditingController density = TextEditingController();
  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() async {
    samplingController.getSampleHistory(
        custId: widget.custId,
        cycleId: widget.cycleId,
        pondId: widget.pondId,
        request: "1");
    await samplingController.checkActiveCycle(
        pondId: widget.pondId, custId: widget.custId);
    var activeCycle = samplingController.activeCycle[0];
    wsa.text = pondController.selectedPondSampling!.wsa ?? "";
    seeds.text = activeCycle.seedStocking ?? "";
    stockDate.text = activeCycle.stockingDate ?? "";
    previousSamplingDate.text = activeCycle.previousSampling ?? "";
    doc.text = activeCycle.doc ?? activeCycle.seedStocking ?? "";
    density.text = samplingController.sampleHistory[0].density ?? "";
  }

  bool validateForm() {
    if (wsa.text.isEmpty ||
        seeds.text.isEmpty ||
        stockDate.text.isEmpty ||
        previousSamplingDate.text.isEmpty ||
        harvestingDate.text.isEmpty ||
        doc.text.isEmpty ||
        dailyFeed.text.isEmpty ||
        totalFeed.text.isEmpty ||
        harvestQuantity.text.isEmpty ||
        abw.text.isEmpty ||
        adg.text.isEmpty ||
        seedSource.text.isEmpty ||
        ph.text.isEmpty ||
        salinity.text.isEmpty ||
        actualBiomass.text.isEmpty ||
        expectedBiomass.text.isEmpty ||
        survival.text.isEmpty ||
        fcr.text.isEmpty ||
        productivity.text.isEmpty ||
        density.text.isEmpty) {
      AppSnackBar.showSnackBar("Please fill all details");
      return false;
    }
    return true;
  }

  clearForm() {
    wsa.clear();
    seeds.clear();
    seedSource.clear();
    stockDate.clear();
    previousSamplingDate.clear();
    harvestingDate.clear();
    doc.clear();
    dailyFeed.clear();
    totalFeed.clear();
    harvestQuantity.clear();
    abw.clear();
    adg.clear();
    ph.clear();
    salinity.clear();
    actualBiomass.clear();
    expectedBiomass.clear();
    survival.clear();
    fcr.clear();
    productivity.clear();
    imagePath = null;
  }

  createHarvest() async {
    TaskController taskController = Get.find();
    var user = await PrefData.getUser();
    await harvesterController.createHarvest(
        taskId: taskController.selectedTask!.id!,
        cycleId: widget.cycleId,
        empId: user!.eId!,
        pondId: widget.pondId,
        custId: widget.custId,
        harvestDate: harvestingDate.text,
        sampleHarvestFlag: selectedHarvest.toString(),
        dailyFeed: dailyFeed.text,
        abw: abw.text,
        survival: survival.text,
        ph: ph.text,
        salinity: salinity.text,
        eBiomass: expectedBiomass.text,
        aBiomass: actualBiomass.text,
        density: density.text,
        adg: adg.text,
        fcr: fcr.text,
        productivity: productivity.text,
        qty: harvestQuantity.text,
        seedSource: seedSource.text,
        doc: doc.text,
        acres: wsa.text,
        totalFeed: totalFeed.text,
        filePath: imagePath ?? "");

    if (harvesterController.apiCallSuccess.isTrue) {
      clearForm();
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Create Harvest",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(DimensConstants.screenPadding),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: wsa,
                    decoration: const InputDecoration(
                      labelText: "WSA(in Acres)",
                    ),
                  ),
                  TextField(
                    controller: seeds,
                    decoration: const InputDecoration(
                      labelText: "Seeds(in Million)",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: stockDate,
                    enabled: false,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Stocking Date",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    enabled: false,
                    readOnly: true,
                    controller: previousSamplingDate,
                    decoration: const InputDecoration(
                      labelText: "Previous Sampling Date",
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000), // restrict past dates
                        lastDate: DateTime.now(), // adjust as needed
                      );

                      if (pickedDate != null) {
                        harvestingDate.text = DateFormat('yyyy-MM-dd HH:mm')
                            .format(pickedDate); // or use your preferred format
                      }
                    },
                    child: TextField(
                      controller: harvestingDate,
                      enabled: false,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "Harvesting Date",
                      ),
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: doc,
                    decoration: const InputDecoration(
                      labelText: "DOC",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: dailyFeed,
                    decoration: const InputDecoration(
                      labelText: "Daily Feed",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: totalFeed,
                    decoration: const InputDecoration(
                      labelText: "Total Feed",
                    ),
                  ),
                  const Gap(10),
                  AppChoiceChip(
                    choices: fullPartialHarvest,
                    selectedChoice: selectedHarvest,
                    onSelected: (value) {
                      setState(() {
                        selectedHarvest = value;
                      });
                    },
                    title: '',
                  ),
                  const Gap(10),
                  TextField(
                    controller: harvestQuantity,
                    decoration: const InputDecoration(
                      labelText: "Harvest Quantity",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: abw,
                    onChanged: (value) {
                      if (value != null && value.isNotEmpty) {
                        adg.text = (num.parse(value) / 2).toString();
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "ABW(in gms)",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: adg,
                    enabled: false,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "ADG(g)",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: seedSource,
                    decoration: const InputDecoration(
                      labelText: "Seed Source",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: ph,
                    decoration: const InputDecoration(
                      labelText: "PH",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: salinity,
                    decoration: const InputDecoration(
                      labelText: "Salinity(ppt)",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: actualBiomass,
                    decoration: const InputDecoration(
                      labelText: "Actual Biomass(Kgs)",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: expectedBiomass,
                    decoration: const InputDecoration(
                      labelText: "Expected Biomass(Kgs)",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: survival,
                    decoration: const InputDecoration(
                      labelText: "Survival",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: fcr,
                    decoration: const InputDecoration(
                      labelText: "FCR",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: productivity,
                    decoration: const InputDecoration(
                      labelText: "Productivity(per acre)",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: density,
                    decoration: const InputDecoration(
                      labelText: "Density",
                    ),
                  ),
                  const Gap(20),
                  Text(
                    "Add Photo",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black),
                  ),
                  const Gap(10),
                  imagePath != null
                      ? Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(imagePath!),
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: -10,
                              top: -10,
                              child: IconButton(
                                icon:
                                    const Icon(Icons.close, color: Colors.red),
                                onPressed: removeImage,
                              ),
                            )
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            showImageOptions();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 30,
                                color: primaryColor,
                              ),
                              const Text("Capture")
                            ],
                          )),
                  const Gap(30),
                  Obx(() => ElevatedButton(
                      onPressed: () {
                        if (validateForm()) {
                          createHarvest();
                        }
                      },
                      child: harvesterController.loading.isTrue
                          ? const AppLoader(
                              color: Colors.white,
                            )
                          : const Text("SUBMIT")))
                ]),
          ),
        ));
  }

  showImageOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pickFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pickFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void removeImage() {
    setState(() {
      imagePath = null;
    });
  }

  final ImagePicker picker = ImagePicker();
  String? imagePath;

  Future<void> pickFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print("Picked from camera: ${image.path}");
      setState(() {
        imagePath = image.path;
      });
    }
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print("Picked from gallery: ${image.path}");
      setState(() {
        imagePath = image.path;
      });
    }
  }
}

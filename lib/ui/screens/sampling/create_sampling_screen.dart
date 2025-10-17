import 'dart:io';

import 'package:bmr/controllers/sampling_controller.dart';
import 'package:bmr/controllers/task_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
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

class CreateSamplingScreen extends StatefulWidget {
  final String custId;
  final String pondId;
  final String cycleId;
  const CreateSamplingScreen(
      {super.key,
      required this.custId,
      required this.pondId,
      required this.cycleId});

  @override
  State<CreateSamplingScreen> createState() => _CreateSamplingScreenState();
}

class _CreateSamplingScreenState extends State<CreateSamplingScreen> {
  SamplingController samplingController = Get.find();
  TextEditingController seeds = TextEditingController();
  TextEditingController stockDate = TextEditingController();
  TextEditingController samplingDate = TextEditingController();
  TextEditingController previousSamplingDate = TextEditingController();
  TextEditingController doc = TextEditingController();
  TextEditingController dailyFeed = TextEditingController();
  TextEditingController abw = TextEditingController();
  TextEditingController adg = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController salinity = TextEditingController();

  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() async {
    await samplingController.checkActiveCycle(
        pondId: widget.pondId, custId: widget.custId);
    var activeCycle = samplingController.activeCycle[0];
    seeds.text = activeCycle.seedStocking ?? "";
    stockDate.text = activeCycle.stockingDate ?? "";
    previousSamplingDate.text = activeCycle.previousSampling ?? "";
    doc.text = activeCycle.doc ?? activeCycle.seedStocking ?? "";
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
                title: "Create Sampling",
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
                        controller: seeds,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Seeds(in Million)",
                        ),
                      ),
                      const Gap(10),
                      GestureDetector(
                        onTap: () async {
                          /*  DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(), // restrict past dates
                            lastDate: DateTime(2100), // adjust as needed
                          );

                          if (pickedDate != null) {
                            stockDate.text = DateFormat('MMM dd yyyy').format(
                                pickedDate); // or use your preferred format
                          }*/
                        },
                        child: TextField(
                          controller: stockDate,
                          enabled: false,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "Stocking Date",
                          ),
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
                            samplingDate.text = DateFormat('yyyy-MM-dd').format(
                                pickedDate); // or use your preferred format
                          }
                        },
                        child: TextField(
                          controller: samplingDate,
                          enabled: false,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "Sampling Date",
                          ),
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        controller: previousSamplingDate,
                        enabled: false,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "Previous Sampling Date",
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        controller: doc,
                        enabled: false,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "DOC",
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        controller: dailyFeed,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Daily Feed(kg)",
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        controller: abw,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value != null && value.isNotEmpty) {
                            adg.text = (num.parse(value) / 2).toString();
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "ABW(g)",
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        controller: adg,
                        enabled: false,
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "ADG(g)",
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        controller: ph,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "PH",
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        controller: salinity,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Salinity",
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
                                    icon: const Icon(Icons.close,
                                        color: Colors.red),
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
                            if (validateForm()) createSampling();
                          },
                          child: samplingController.loading.isTrue
                              ? const AppLoader(
                                  color: Colors.white,
                                )
                              : const Text("SUBMIT")))
                    ]),
              ),
            ));
      },
    );
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

  bool validateForm() {
    if (seeds.text.isEmpty ||
        stockDate.text.isEmpty ||
        samplingDate.text.isEmpty ||
        previousSamplingDate.text.isEmpty ||
        doc.text.isEmpty ||
        dailyFeed.text.isEmpty ||
        abw.text.isEmpty ||
        adg.text.isEmpty ||
        ph.text.isEmpty ||
        salinity.text.isEmpty) {
      AppSnackBar.showSnackBar("Please fill all data");
      return false;
    }

    return true;
  }

  createSampling() async {
    UserController userController = Get.find();
    TaskController taskController = Get.find();
    await samplingController.createSamplingWithFile(
        taskId: taskController.selectedTask != null
            ? taskController.selectedTask!.id!
            : "",
        pondId: widget.pondId,
        custId: widget.custId,
        cycleId: widget.cycleId,
        empId: userController.user!.eId!,
        newCycle: "",
        cultureSeedDate: "",
        doc: doc.text,
        stockingDate: stockDate.text,
        seedStocking: seeds.text,
        ph: ph.text,
        abw: abw.text,
        salinity: salinity.text,
        samplingDate: samplingDate.text,
        dailyFeed: dailyFeed.text,
        adg: adg.text,
        filePath: imagePath ?? "");

    if (samplingController.errorMessage != null) {
      AppSnackBar.showSnackBar(samplingController.errorMessage);
    } else {
      AppSnackBar.showSnackBar("Sampling created successfully");
      context.pop();
    }
  }
}

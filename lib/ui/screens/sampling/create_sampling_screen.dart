import 'dart:io';

import 'package:bmr/controllers/sampling_controller.dart';
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
  const CreateSamplingScreen({super.key});

  @override
  State<CreateSamplingScreen> createState() => _CreateSamplingScreenState();
}

class _CreateSamplingScreenState extends State<CreateSamplingScreen> {
  SamplingController samplingController = Get.find();
  TextEditingController seeds = TextEditingController();
  TextEditingController stockDate = TextEditingController();
  TextEditingController samplingDate = TextEditingController();
  TextEditingController doc = TextEditingController();
  TextEditingController dailyFeed = TextEditingController();
  TextEditingController abw = TextEditingController();
  TextEditingController adg = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController salinity = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      hintText: "Seeds(in Million)",
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(), // restrict past dates
                        lastDate: DateTime(2100), // adjust as needed
                      );

                      if (pickedDate != null) {
                        stockDate.text = DateFormat('MMM dd yyyy')
                            .format(pickedDate); // or use your preferred format
                      }
                    },
                    child: TextField(
                      controller: stockDate,
                      enabled: false,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: "Stocking Date",
                      ),
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(), // restrict past dates
                        lastDate: DateTime(2100), // adjust as needed
                      );

                      if (pickedDate != null) {
                        samplingDate.text = DateFormat('MMM dd yyyy')
                            .format(pickedDate); // or use your preferred format
                      }
                    },
                    child: TextField(
                      controller: samplingDate,
                      enabled: false,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: "Sampling Date",
                      ),
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: doc,
                    decoration: const InputDecoration(
                      hintText: "DOC",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: dailyFeed,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Daily Feed(kg)",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: abw,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "ABW(g)",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: adg,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "ADG(g)",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: ph,
                    decoration: const InputDecoration(
                      hintText: "PH",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: salinity,
                    decoration: const InputDecoration(
                      hintText: "Salinity",
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
                        createSampling();
                      },
                      child: samplingController.loading.isTrue
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

  createSampling() async {
    UserController userController = Get.find();
    await samplingController.createSamplingWithFile(
        taskId: "",
        pondId: "",
        custId: "",
        cycleId: "",
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

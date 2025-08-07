import 'package:bmr/controllers/custom_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/constants/strings_constants.dart';
import 'package:bmr/ui/elements/app_button.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/elements/app_snackbar.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../controllers/customer_controller.dart';
import '../widgets/app_choice_chip.dart';

class CreateFarmerScreen extends StatefulWidget {
  const CreateFarmerScreen({super.key});

  @override
  State<CreateFarmerScreen> createState() => _CreateFarmerScreenState();
}

class _CreateFarmerScreenState extends State<CreateFarmerScreen> {
  String? selectedValue;
  CustomController customController = Get.find();
  CustomerController customerController = Get.find();
  UserController userController = Get.find();

  TextEditingController contactNoController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  TextEditingController bmrController = TextEditingController();

  @override
  void initState() {
    super.initState();

    customController.getStateCityList();
    customController.getZoneList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Create Farmer",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(DimensConstants.screenPadding),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Column(
                      children: [
                        DropdownButton(
                          value: customerController.selectedZone.value,
                          hint: Text(customController.zoneLoading.isTrue
                              ? "Loading zones..."
                              : "Select Zone"),
                          isExpanded: true,
                          items:
                              customController.zoneListSting.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            customerController.selectedZone.value =
                                newValue ?? "";
                          },
                        ),
                        const Gap(10),
                        DropdownButton(
                          value: customerController.selectedState.value,
                          hint: Text(customController.stateLoading.isTrue
                              ? "Loading states..."
                              : "Select State"),
                          isExpanded: true,
                          // Makes dropdown full width
                          items: customController.stateListSting
                              .map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            customController.getCityList(newValue ?? "");
                            customerController.selectedState.value =
                                newValue ?? "";
                          },
                        ),
                        const Gap(10),
                        DropdownButton(
                          value: customerController.selectedCity.value,
                          hint: Text(customController.stateLoading.isTrue
                              ? "Loading cities..."
                              : "Select City"),
                          isExpanded: true,
                          // Makes dropdown full width
                          items:
                              customController.cityListSting.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            customerController.selectedCity.value =
                                newValue ?? "";
                          },
                        ),
                        const Gap(10),
                      ],
                    ),
                  ),
                  TextField(
                    controller: contactNoController,
                    decoration: const InputDecoration(
                      hintText: "Contact Number",
                    ),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                  ),
                  const Gap(10),
                  TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      hintText: "First Name",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      hintText: "Last Name",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: address1Controller,
                    decoration: const InputDecoration(
                      hintText: "Address 1",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: address2Controller,
                    decoration: const InputDecoration(
                      hintText: "Address 2",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: commentsController,
                    decoration: const InputDecoration(
                      hintText: "Comments",
                    ),
                  ),
                  const Gap(10),
                  TextField(
                    controller: bmrController,
                    decoration: const InputDecoration(
                      hintText: "BMR",
                    ),
                  ),
                  Gap(10),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // own   Aers
                        AppChoiceChip(
                          choices: customerController.ownOthers,
                          selectedChoice:
                              customerController.selectedOwnOthers.value,
                          onSelected: (value) {
                            customerController.selectedOwnOthers.value = value;
                          },
                          title: '',
                        ),
                        Gap(10),

                        // farmer/dealer
                        AppChoiceChip(
                          choices: customerController.farmerDealer,
                          selectedChoice:
                              customerController.selectedFarmerDealer.value,
                          onSelected: (value) {
                            customerController.selectedFarmerDealer.value =
                                value;
                          },
                          title: '',
                        ),
                        Gap(10),

                        // ACTIVE/INACTIVE
                        AppChoiceChip(
                          choices: customerController.activeInactive,
                          selectedChoice:
                              customerController.selectedActiveInactive.value,
                          onSelected: (value) {
                            customerController.selectedActiveInactive.value =
                                value;
                          },
                          title: '',
                        ),

                        Gap(30),
                        Divider(),
                        Gap(30),

                        customerController.loading.isTrue
                            ? Center(child: const AppLoader())
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: AppButton(
                                        title: "CREATE FARMER",
                                        onTap: () {
                                          createFarmer();
                                        }),
                                  ),
                                  const Gap(10),
                                  Expanded(
                                      child: TextButton(
                                    onPressed: () {
                                      resetForm();
                                    },
                                    child: const Text("Reset All"),
                                  ))
                                ],
                              ),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }

  resetForm() {
    contactNoController.clear();
    firstNameController.clear();
    lastNameController.clear();
    address1Controller.clear();
    address2Controller.clear();
    commentsController.clear();
    bmrController.clear();
    customerController.selectedZone.value = null;
    customerController.selectedState.value = null;
    customerController.selectedOwnOthers.value = 0;
    customerController.selectedFarmerDealer.value = 0;
    customerController.selectedActiveInactive.value = 0;
  }

  createFarmer() async {
    await customerController.createCustomer(
      contactNo: contactNoController.text,
      custType:
          customerController.selectedOwnOthers.value == 0 ? "Own" : "Others",
      firstname: firstNameController.text,
      lastname: lastNameController.text,
      address1: address1Controller.text,
      address2: address2Controller.text,
      city: customerController.selectedCity.value ?? "",
      state: customerController.selectedState.value ?? "",
      zone: getSelectedZoneId() ?? "1",
      comments: commentsController.text,
      category: userController.user!.catId ?? "2",
      customerOf: "BMR",
      status: customerController.selectedActiveInactive.value == 0
          ? "Active"
          : "Inactive",
    );

    if (customerController.createFarmerSuccess.value) {
      AppSnackBar.showSnackBar("Farmer created successfully");
      context.pop();
    } else {
      AppSnackBar.showSnackBar(customerController.errorMessage ??
          StringConstants.somethingWentWrong);
    }
  }

  String? getSelectedZoneId() {
    final selected = customerController.selectedZone.value;
    if (selected == null) return null;

    final matchedZone = customController.zoneList.firstWhereOrNull(
      (zone) => zone.zoneName == selected,
    );

    return matchedZone?.id;
  }
}

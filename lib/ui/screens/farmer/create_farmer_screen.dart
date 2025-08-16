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
  TextEditingController dealerController = TextEditingController();

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
                            customerController.getSelectedZoneId();
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
                  Obx(
                    () => customerController.selectedOwnOthers.value == 0
                        ? TextField(
                            controller: bmrController,
                            decoration: const InputDecoration(
                              hintText: "BMR",
                            ),
                          )
                        : DropdownButton(
                            value: customerController.selectedDealer.value,
                            hint: Text(customController.dealerLoading.isTrue
                                ? "Loading dealers..."
                                : "Select Dealer"),
                            isExpanded: true,
                            // Makes dropdown full width
                            items: customController.dealerListSting
                                .map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              customerController.selectedDealer.value =
                                  newValue ?? "";
                            },
                          ),
                  ),
                  const Gap(10),
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
                            if (customerController.selectedOwnOthers.value ==
                                1) {
                              // get zone id from selected zone
                              var zoneId =
                                  customerController.getSelectedZoneId();
                              // if zoneId is not null, get dealers list
                              if (zoneId != null) {
                                customController.getDealersList(zoneId);
                              }
                            } else {
                              customerController.selectedDealer.value = null;
                            }
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
                            ? const Center(child: AppLoader())
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: AppButton(
                                        title: "CREATE FARMER",
                                        onTap: () {
                                          if (validateFrom()) {
                                            createFarmer();
                                          }
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

  bool validateFrom() {
    if (contactNoController.text.isEmpty) {
      AppSnackBar.showSnackBar("Please enter contact number");
      return false;
    }
    if (firstNameController.text.isEmpty) {
      AppSnackBar.showSnackBar("Please enter first name");
      return false;
    }
    if (lastNameController.text.isEmpty) {
      AppSnackBar.showSnackBar("Please enter last name");
      return false;
    }
    if (address1Controller.text.isEmpty) {
      AppSnackBar.showSnackBar("Please enter address 1");
      return false;
    }
    if (customerController.selectedState.value == null) {
      AppSnackBar.showSnackBar("Please select state");
      return false;
    }
    if (customerController.selectedCity.value == null) {
      AppSnackBar.showSnackBar("Please select city");
      return false;
    }
    if (customerController.selectedZone.value == null) {
      AppSnackBar.showSnackBar("Please select zone");
      return false;
    }
    if (customerController.selectedOwnOthers.value == 1 &&
        customerController.selectedDealer.value == null) {
      AppSnackBar.showSnackBar("Please select dealer");
      return false;
    }
    return true;
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
      zone: customerController.getSelectedZoneId() ?? "1",
      comments: commentsController.text,
      // if farmer then category is 2, if dealer then 1
      category: customerController.selectedFarmerDealer.value == 0 ? "2" : "1",
      customerOf: customerController.selectedOwnOthers.value == 1
          ? customerController.selectedDealer.value ?? ""
          : "BMR",
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
}

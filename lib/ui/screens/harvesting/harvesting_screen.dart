import 'package:bmr/controllers/customer_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/routes/mobile_routes.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../controllers/pond_controller.dart';
import '../../elements/textfield_with_dropdown_suggestion.dart';
import '../../elements/vertical_line.dart';

class HarvestingScreen extends StatefulWidget {
  const HarvestingScreen({super.key});

  @override
  State<HarvestingScreen> createState() => _HarvestingScreenState();
}

class _HarvestingScreenState extends State<HarvestingScreen> {
  CustomerController customerController = Get.find();
  TextEditingController customerName = TextEditingController();
  PondController pondController = Get.find();

  @override
  void initState() {
    super.initState();
    customerController.getCustomerList();
    getCustomerSampling("");
  }

  getCustomerSampling(String customerName) {
    // todo: get customer id based on customer name and send customer id to api
    pondController.getPondSamplingList("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Harvest",
          )),
      /* floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          context.push(AppPath.createPond);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),*/
      body: Padding(
        padding: EdgeInsets.all(DimensConstants.screenPadding),
        child: Column(
          children: [
            Obx(() => TextFieldWithDropdownSuggestion(
                  list: customerController.customersStringList,
                  controller: customerName,
                  onSelect: () {
                    getCustomerSampling(customerName.text);
                  },
                  hintText: customerController.loading.isTrue
                      ? "Loading customer data..."
                      : 'Customer name',
                )),
            const Gap(10),
            Obx(() => Expanded(
                  child: pondController.loading.isTrue
                      ? const AppLoader()
                      : pondController.pondSamplingListHasData.isFalse
                          ? Text("No Data Found")
                          : ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsetsGeometry.all(10),
                                  child: Container(
                                    padding: const EdgeInsetsGeometry.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("pond_pond1"),
                                        Gap(20),
                                        Text("WSA(Acres): 40"),
                                        Gap(10),
                                        Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                "Pond Details",
                                                style: TextStyle(
                                                    color: primaryColorDark),
                                                textAlign: TextAlign.center,
                                              )),
                                              VerticalLine(
                                                height: double.infinity,
                                                width: 0.5,
                                              ),
                                              Expanded(
                                                  child: GestureDetector(
                                                onTap: () {
                                                  context.push(
                                                      AppPath.historyHarvest);
                                                },
                                                child: Text(
                                                  "History",
                                                  style: TextStyle(
                                                      color: primaryColorDark),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                              VerticalLine(
                                                height: double.infinity,
                                                width: 0.5,
                                              ),
                                              Expanded(
                                                  child: GestureDetector(
                                                onTap: () {
                                                  context.push(
                                                      AppPath.enterHarvest);
                                                },
                                                child: Text(
                                                  "Enter Harvest",
                                                  style: TextStyle(
                                                      color: primaryColorLight),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                ))
          ],
        ),
      ),
    );
  }
}

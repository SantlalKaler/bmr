import 'package:bmr/controllers/customer_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/screens/harvesting/single_harvesting_item.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/pond_controller.dart';
import '../../elements/textfield_with_dropdown_suggestion.dart';

class HarvestingScreen extends StatefulWidget {
  final String? customerId;
  const HarvestingScreen({super.key, this.customerId});

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
    pondController.selectedPondSampling = null;
    if (widget.customerId == null) {
      customerController.getCustomerList();
    } else {
      pondController.getPondSamplingList((widget.customerId!));
    }
  }

  getCustomerSampling(String customerName) {
    var customerId = customerController.getCustomerIdByName(customerName);
    pondController.getPondSamplingList(customerId!);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PondController(),
        builder: (controller) {
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
                  if (widget.customerId == null)
                    TextFieldWithDropdownSuggestion(
                      list: customerController.customersStringList,
                      controller: customerName,
                      onSelect: () {
                        getCustomerSampling(customerName.text);
                      },
                      hintText: customerController.loading.isTrue
                          ? "Loading customer data..."
                          : 'Customer name',
                    ),
                  Expanded(
                    child: controller.loading.isTrue
                        ? const Center(child: AppLoader())
                        : controller.pondSamplings.isEmpty
                            ? const Center(child: Text("No data found."))
                            : ListView.builder(
                                itemCount: pondController.pondSamplings.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var pondSample =
                                      pondController.pondSamplings[index];
                                  return SingleHarvestingItem(
                                    pondSampling: pondSample,
                                    custId: widget.customerId ??
                                        customerController.getCustomerIdByName(
                                            customerName.text)!,
                                  );
                                },
                              ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

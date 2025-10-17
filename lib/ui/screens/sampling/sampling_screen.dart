import 'package:bmr/controllers/customer_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/screens/sampling/components/single_sampling_item.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../controllers/pond_controller.dart';
import '../../elements/textfield_with_dropdown_suggestion.dart';

class SamplingScreen extends StatefulWidget {
  final String? customerId;
  const SamplingScreen({super.key, this.customerId});

  @override
  State<SamplingScreen> createState() => _SamplingScreenState();
}

class _SamplingScreenState extends State<SamplingScreen> {
  CustomerController customerController = Get.find();
  PondController pondController = Get.find();
  TextEditingController customerName = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.customerId == null) {
      customerController.getCustomerList();
    } else {
      pondController.getPondSamplingList((widget.customerId!));
    }
  }

  getCustomerSampling(String customerName) async {
    var customerId = customerController.getCustomerIdByName(customerName);
    pondController.getPondSamplingList(customerId!);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PondController(),
        builder: (controller) => Scaffold(
              backgroundColor: scaffoldBackgroundColor,
              appBar: const PreferredSize(
                  preferredSize: Size(double.infinity, 120),
                  child: TopAppBar(
                    title: "Sampling",
                  )),
              body: Padding(
                padding: EdgeInsets.all(DimensConstants.screenPadding),
                child: Column(
                  children: [
                    if (widget.customerId == null)
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
                    Expanded(
                      child: controller.loading.isTrue
                          ? const Center(child: AppLoader())
                          : controller.pondSamplings.isEmpty
                              ? const Center(child: Text("No data found."))
                              : ListView.builder(
                                  itemCount:
                                      pondController.pondSamplings.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var pondSample =
                                        pondController.pondSamplings[index];
                                    return SingleSamplingItem(
                                      pondSampling: pondSample,
                                      custId: widget.customerId ??
                                          customerController
                                              .getCustomerIdByName(
                                                  customerName.text)!,
                                    );
                                  },
                                ),
                    )
                  ],
                ),
              ),
            ));
  }
}

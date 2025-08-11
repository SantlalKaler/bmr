import 'package:bmr/controllers/customer_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/screens/sampling/components/single_sampling_item.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../controllers/pond_controller.dart';
import '../../elements/textfield_with_dropdown_suggestion.dart';

class SamplingScreen extends StatefulWidget {
  const SamplingScreen({super.key});

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
    customerController.getCustomerList();
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
            title: "Sampling",
          )),
      body: Padding(
        padding: EdgeInsets.all(DimensConstants.screenPadding),
        child: Column(
          children: [
            Obx(() => TextFieldWithDropdownSuggestion(
                  list: const ['Customer 1', 'Customer 2', 'Customer 3'],
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
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const SingleSamplingItem();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

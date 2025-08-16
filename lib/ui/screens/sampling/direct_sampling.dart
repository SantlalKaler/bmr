import 'package:bmr/controllers/pond_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/screens/sampling/components/choose_customer_dialog.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/customer_controller.dart';
import '../../elements/textfield_with_dropdown_suggestion.dart';
import 'components/single_sampling_item.dart';

class DirectSamplingScreen extends StatefulWidget {
  const DirectSamplingScreen({super.key});

  @override
  State<DirectSamplingScreen> createState() => _DirectSamplingScreenState();
}

class _DirectSamplingScreenState extends State<DirectSamplingScreen> {
  CustomerController customerController = Get.find();
  TextEditingController customerName = TextEditingController();
  PondController pondController = Get.find();

  @override
  void initState() {
    customerController.getCustomerList();
  }

  void selectCustomerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Dialog(
        child: ChooseCustomerDialog(),
      ),
    );
  }

  getCustomerSampling(String customerName) {
    // todo: get customer id based on customer name and send customer id to api
    pondController.getPondSamplingList("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Sampling",
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(DimensConstants.screenPadding),
                child: Obx(() => TextFieldWithDropdownSuggestion(
                      list: customerController.customersStringList,
                      controller: customerName,
                      onSelect: () {
                        getCustomerSampling(customerName.text);
                      },
                      hintText: customerController.loading.isTrue
                          ? "Loading customer data..."
                          : 'Customer name',
                    )),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return SingleSamplingItem();
                  },
                ),
              )
            ]));
  }
}

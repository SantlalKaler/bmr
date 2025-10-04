import 'package:bmr/controllers/customer_controller.dart';
import 'package:bmr/ui/constants/constant.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../routes/mobile_routes.dart';

class DirectTechnicalScreen extends StatefulWidget {
  const DirectTechnicalScreen({super.key});

  @override
  State<DirectTechnicalScreen> createState() => _DirectTechnicalScreenState();
}

class _DirectTechnicalScreenState extends State<DirectTechnicalScreen> {
  CustomerController customerController = Get.find();
  TextEditingController customerName = TextEditingController();

  @override
  void initState() {
    super.initState();
    customerController.getCustomerList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Technical",
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(DimensConstants.screenPadding),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: customerName,
                  decoration: const InputDecoration(
                    labelText: 'Customer Name',
                    hintText: 'Enter customer name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      // This will trigger the filtering of the list
                      customerController.customersStringFilterList.value =
                          customerController.customersStringList
                              .where((customer) => customer
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                    });
                  },
                ),
                const Gap(10),
                Expanded(
                  child: Obx(() => customerController.loading.isTrue
                      ? Center(child: AppLoader())
                      : customerController.customersStringFilterList.isEmpty
                          ? const Center(child: Text("No Customer Found!"))
                          : ListView.builder(
                              // shrinkWrap: true,
                              itemCount: customerController
                                  .customersStringFilterList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(customerController
                                      .customersStringFilterList[index]),
                                  onTap: () {
                                    setSelectedCustomer(customerController
                                        .customersStringFilterList[index]);
                                    context.push(AppPath.technicalQuries);
                                  },
                                );
                              },
                            )),
                ),
              ]),
        ));
  }

  setSelectedCustomer(String customerName) {
    customerController.selectedCustomer =
        customerController.customers.firstWhere((customer) {
      var customerFullName =
          "${customer.firstName ?? ''} ${customer.lastName ?? ''}".trim();
      return customerFullName.toLowerCase() == customerName.toLowerCase();
    });

    Constant.printValue(
        "Selected customer is ${customerController.selectedCustomer?.firstName} ${customerController.selectedCustomer?.lastName}");
  }
}

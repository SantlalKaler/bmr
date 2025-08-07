import 'package:bmr/controllers/customer_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/screens/sampling/components/single_sampling_item.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SamplingScreen extends StatefulWidget {
  const SamplingScreen({super.key});

  @override
  State<SamplingScreen> createState() => _SamplingScreenState();
}

class _SamplingScreenState extends State<SamplingScreen> {
  CustomerController customerController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customerController.getCustomerList();
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
            const TextField(
              decoration: InputDecoration(
                hintText: "Customer Name",
              ),
            ),
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

import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/screens/sampling/components/choose_customer_dialog.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';

class DirectSamplingScreen extends StatefulWidget {
  const DirectSamplingScreen({super.key});

  @override
  State<DirectSamplingScreen> createState() => _DirectSamplingScreenState();
}

class _DirectSamplingScreenState extends State<DirectSamplingScreen> {
  void selectCustomerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Dialog(
        child: ChooseCustomerDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Sampling",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(DimensConstants.screenPadding),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectCustomerDialog(context);
                    },
                    child: const TextField(
                      readOnly: true,
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: "Select Customer Name",
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}

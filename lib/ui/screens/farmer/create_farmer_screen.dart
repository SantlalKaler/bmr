import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_button.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CreateFarmerScreen extends StatefulWidget {
  const CreateFarmerScreen({super.key});

  @override
  State<CreateFarmerScreen> createState() => _CreateFarmerScreenState();
}

class _CreateFarmerScreenState extends State<CreateFarmerScreen> {
  String? selectedValue;

  final List<String> items = ['Option 1', 'Option 2', 'Option 3'];

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
                  DropdownButton(
                    value: selectedValue,
                    hint: const Text("AP-1"),
                    isExpanded: true,
                    // Makes dropdown full width
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Contact Number",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "First Name",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Last Name",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Address 1",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Address 2",
                    ),
                  ),
                  Gap(10),
                  DropdownButton(
                    value: selectedValue,
                    hint: const Text("Select State"),
                    isExpanded: true,
                    // Makes dropdown full width
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Comments",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "BMR",
                    ),
                  ),
                  Gap(10),

                  // own/others
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppButton(title: "OWN", onTap: () {}),
                      ),
                      Gap(10),
                      Expanded(
                          child: AppButton(
                        title: "OTHERS",
                        onTap: () {},
                        backgroundColor: Colors.white,
                        textColor: primaryColor,
                      ))
                    ],
                  ),
                  Gap(10),

                  // farmer/dealer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppButton(title: "FARMERS", onTap: () {}),
                      ),
                      Gap(10),
                      Expanded(
                          child: AppButton(
                        title: "DEALERS",
                        onTap: () {},
                        backgroundColor: Colors.white,
                        textColor: primaryColor,
                      ))
                    ],
                  ),
                  Gap(10),

                  // ACTIVE/INACTIVE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppButton(title: "ACTIVE", onTap: () {}),
                      ),
                      Gap(10),
                      Expanded(
                          child: AppButton(
                        title: "INACTIVE",
                        onTap: () {},
                        backgroundColor: Colors.white,
                        textColor: primaryColor,
                      ))
                    ],
                  ),
                  Gap(30),
                  Divider(),
                  Gap(30),

                  // ACTIVE/INACTIVE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppButton(title: "CREATE FARMER", onTap: () {}),
                      ),
                      Gap(10),
                      Expanded(
                          child: TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text("Reset All"),
                      ))
                    ],
                  ),
                ]),
          ),
        ));
  }
}

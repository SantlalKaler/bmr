import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/screens/widgets/top_app_bar.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CreateSamplingScreen extends StatefulWidget {
  const CreateSamplingScreen({super.key});

  @override
  State<CreateSamplingScreen> createState() => _CreateSamplingScreenState();
}

class _CreateSamplingScreenState extends State<CreateSamplingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: TopAppBar(
            title: "Create Sampling",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(DimensConstants.screenPadding),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Seeds(in Million)",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Stocking Date",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Sampling Date",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "DOC",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Dairy Feed(kg)",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "ABW(g)",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "ADG(g)",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "PH",
                    ),
                  ),
                  Gap(10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Salinity",
                    ),
                  ),
                  Gap(20),
                  Text(
                    "Add Photo",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black),
                  ),
                  Gap(10),
                  GestureDetector(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: primaryColor,
                          ),
                          Text("Capture")
                        ],
                      )),
                  Gap(30),
                  ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text("SUBMIT"))
                ]),
          ),
        ));
  }
}

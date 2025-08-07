import 'package:bmr/controllers/employee_controller.dart';
import 'package:bmr/ui/constants/strings_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../controllers/map_controller.dart';
import '../widgets/top_app_bar.dart';

class DayInOutScreen extends StatefulWidget {
  const DayInOutScreen({super.key, required this.dayIn});
  final bool dayIn;
  @override
  State<DayInOutScreen> createState() => _DayInOutScreenState();
}

class _DayInOutScreenState extends State<DayInOutScreen> {
  final TextEditingController meterReadingController = TextEditingController();
  EmployeeController employeeController = Get.find();

  MapController mapController = Get.find();

  @override
  void initState() {
    mapController.getCurrentLocation();
    mapController.getCurrentLocationB();
    super.initState();
  }

  void checkIn() async {
    await employeeController.attendanceCheckIn(meterReadingController.text);

    if (employeeController.checkInOrCheckOutSuccess.isTrue) {
      Fluttertoast.showToast(msg: "Check in success");
      context.pop();
    } else {
      Fluttertoast.showToast(
          msg: employeeController.errorMessage ??
              StringConstants.somethingWentWrong);
    }
  }

  void checkOut() async {
    await employeeController.attendanceCheckOut(meterReadingController.text);

    if (employeeController.checkInOrCheckOutSuccess.isTrue) {
      Fluttertoast.showToast(msg: "Check out success");
      context.pop();
    } else {
      Fluttertoast.showToast(
          msg: employeeController.errorMessage ??
              StringConstants.somethingWentWrong);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top AppBar design
          const TopAppBar(
            title: "Attendance",
          ),

          const SizedBox(height: 40),

          // Start Meter Reading input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: meterReadingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: widget.dayIn
                    ? "Starting Meter Reading"
                    : "Closing Meter Reading",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),

          const Spacer(),

          // Day In Circle Button
          Obx(
            () => Center(
              child: employeeController.loading.isTrue
                  ? const AppLoader()
                  : GestureDetector(
                      onTap: () {
                        if (meterReadingController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter meter reading");
                        } else {
                          if (widget.dayIn) {
                            checkIn();
                          } else {
                            checkOut();
                          }
                        }
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              spreadRadius: 4,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          !widget.dayIn ? "DAY OUT" : "DAY IN",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}

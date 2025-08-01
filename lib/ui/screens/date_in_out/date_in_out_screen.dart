import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/mobile_routes.dart';
import '../widgets/top_app_bar.dart';

class DateInOutScreen extends StatefulWidget {
  DateInOutScreen({super.key, required this.dayIn});
  bool dayIn = false;
  @override
  State<DateInOutScreen> createState() => _DateInOutScreenState();
}

class _DateInOutScreenState extends State<DateInOutScreen> {
  final TextEditingController meterReadingController = TextEditingController();

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
                hintText: "Starting Meter Reading",
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
          Center(
            child: GestureDetector(
              onTap: () {
                context.pushReplacement(AppPath.homePath);
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
                child: const Text(
                  "DAY IN",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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

import 'dart:async';

import 'package:bmr/controllers/conectivity_controller.dart';
import 'package:bmr/controllers/employee_controller.dart';
import 'package:bmr/controllers/map_controller.dart';
import 'package:bmr/ui/constants/constant.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class GpsLogger {
  Timer? _locationTimer; // For primary 60s updates
  Timer? _backupTimer; // For backup 5min updates
  LocationData? _lastSentLocation;
  bool _isRunning = false;

  /// Starts GPS logging
  void startGpsLogging() {
    if (_isRunning) return; // Avoid multiple starts
    _isRunning = true;

    Constant.printValue("GPS Logging started");

    // Primary GPS tracker - runs every 60 seconds
    _locationTimer = Timer.periodic(const Duration(seconds: 60), (timer) async {
      await _trySendLocation(forceSend: false);
    });

    // Backup / Keep Alive - runs every 5 minutes
    _backupTimer = Timer.periodic(const Duration(minutes: 5), (timer) async {
      await _trySendLocation(forceSend: true);
    });
  }

  /// Stops GPS logging
  void stopGpsLogging() {
    _locationTimer?.cancel();
    _backupTimer?.cancel();
    _locationTimer = null;
    _backupTimer = null;
    _isRunning = false;
    Constant.printValue("GPS Logging stopped");
  }

  /// Checks and sends location if needed
  Future<void> _trySendLocation({bool forceSend = false}) async {
    MapController mapController = Get.find();
    EmployeeController employeeController = Get.find();
    ConnectivityController connectivityController = Get.find();
    try {
      final location =
          await mapController.getCurrentLocation(); // You already have this
      final internetAvailable =
          connectivityController.isInternetAvailable.isTrue;

      if (!internetAvailable) {
        Constant.printValue("No internet. Queuing data...");
        // Save to local DB or queue here
        return;
      }

      // Send only if location changed OR forced by backup timer
      if (forceSend || location != _lastSentLocation) {
        await employeeController.employeeGpsLog();
        _lastSentLocation = location;
        Constant.printValue("Location sent: $location");
      } else {
        Constant.printValue("Location unchanged, skipping send");
      }
    } catch (e) {
      Constant.printValue("Error sending location: $e");
    }
  }
}

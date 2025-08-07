import 'dart:convert';

import 'package:bmr/controllers/auth_controller.dart';
import 'package:bmr/data/pref_data.dart';
import 'package:bmr/ui/constants/strings_constants.dart';
import 'package:dio/dio.dart' as dio;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../data/model/user.dart';
import '../ui/constants/constant.dart';
import 'map_controller.dart';

class EmployeeController extends GetxController {
  RxBool loading = false.obs;
  RxBool checkInOrCheckOutSuccess = false.obs;
  String? errorMessage;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;

  AuthController authController = Get.find();
  User? user;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  Future getUser() async {
    user = await PrefData.getUser();
  }

  void resetValues() {
    checkInOrCheckOutSuccess.value = false;
    errorMessage = null;
  }

  Future attendanceCheckIn(String startMeterReading) async {
    resetValues();
    setLoading();

    // get users current location
    MapController mapController = Get.find();
    Position? position = await mapController.getCurrentLocation();
    try {
      var data = dio.FormData.fromMap({
        "empid": user!.eId,
        "check_in": "",
        "geo_checkin": "",
        "starting_meter": startMeterReading
      });

      await apiService.post(AppUrls.createAttendance, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              Constant.printValue("Json data is string");
              jsonData = json.decode(jsonData);
            }

            if (jsonData[StringConstants.apiSuccess].toString() ==
                StringConstants.apiSuccessStatus) {
              checkInOrCheckOutSuccess.value = true;

              // save check in updated id
              PrefData.saveCheckInId(jsonData['update_id']);
            } else {
              errorMessage = jsonData['val'];
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }

  Future attendanceCheckOut(String closingMeter) async {
    resetValues();
    setLoading();
    var updateId = await PrefData.getCheckInId();
    try {
      var data = dio.FormData.fromMap({
        "empid": user!.eId,
        "update_id": updateId,
        "check_out": "",
        "geo_checkout": "",
        "closing_meter": closingMeter
      });

      await apiService.post(AppUrls.updateAttendance, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            if (jsonData[StringConstants.apiSuccess].toString() ==
                StringConstants.apiSuccessStatus) {
              checkInOrCheckOutSuccess.value = true;
            } else {
              errorMessage = jsonData['val'];
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }

  Future dayInStatusVerification() async {
    try {
      await apiService
          .get(
        "${AppUrls.dayInStatusVerification}?emp_id={emp_id}",
      )
          .then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future employeeGpsLog() async {
    try {
      var data = {
        "empid": "",
        "timestamp": "",
        "device_id": "",
        "gps_coordinates": "",
        "battery_level": ""
      };
      await apiService.post(AppUrls.dayInStatusVerification, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future employeeList() async {
    try {
      var data = {
        "login_id": "",
      };
      await apiService.post(AppUrls.getlistapi, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future regionBasedEmployeeList() async {
    try {
      var data = {
        "region_id": "",
        "login_id": "",
      };
      await apiService.post(AppUrls.getregionemployeelist, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future employeeLiveRoute() async {
    try {
      var data = {
        "emp_id": "",
        "date": "",
      };
      await apiService.post(AppUrls.getliveroute, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future employeeRouteHistory() async {
    try {
      var data = {
        "emp_id": "",
        "date": "",
      };
      await apiService.post(AppUrls.getemployeelivelog, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future employeeSessionList() async {
    try {
      var data = {};
      await apiService.post(AppUrls.employeeloginlistapi, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future sendCustomerEmail() async {
    try {
      var data = {
        "guest_email": "",
        "emp_name": "",
        "task_id": "",
        "comments": "",
      };
      await apiService.post(AppUrls.sendcustomermail, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }
}

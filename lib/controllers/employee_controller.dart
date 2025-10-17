import 'dart:convert';
import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:bmr/controllers/auth_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/data/model/DayInVerificationModel.dart';
import 'package:bmr/data/model/RegionBasedEmployee.dart';
import 'package:bmr/data/model/RouteHistory.dart';
import 'package:bmr/data/model/employee.dart';
import 'package:bmr/data/model/employee_location.dart';
import 'package:bmr/data/pref_data.dart';
import 'package:bmr/ui/constants/strings_constants.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart' as lct;
import 'package:uuid/uuid.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../data/model/user.dart';
import '../ui/constants/constant.dart';
import '../utils/date_converter.dart';
import 'map_controller.dart';

class EmployeeController extends GetxController {
  RxBool loading = false.obs;
  RxBool checkInOrCheckOutSuccess = false.obs;
  RxBool dayInVerificationDataFound = false.obs;
  DayInVerificationModel? dayInVerificationModel;
  MapController mapController = Get.find();
  RxList<Employee> employeeList = <Employee>[].obs;
  RxList<EmployeeLocation> employeeLocation = <EmployeeLocation>[].obs;
  RxList<RouteHistory> routeHistory = <RouteHistory>[].obs;
  RxList<RegionBasedEmployee> regionBasedEmployees =
      <RegionBasedEmployee>[].obs;
  RxList<String> employeeListString = <String>[].obs;
  String? errorMessage;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;

  AuthController authController = Get.find();
  UserController userController = Get.find();
  User? user;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  Future getUser() async {
    user = await PrefData.getUser();
  }

  String? getEmployeeIdByName(String name) {
    return employeeList
        .firstWhere(
          (c) =>
              "${c.firstname ?? ''} ${c.lastname ?? ''}".trim().toLowerCase() ==
              name.trim().toLowerCase(),
          orElse: () => Employee(id: null),
        )
        .id;
  }

  void resetValues() {
    checkInOrCheckOutSuccess.value = false;
    errorMessage = null;
  }

  Future attendanceCheckIn(String startMeterReading) async {
    resetValues();
    setLoading();

    if (mapController.currentLocation == null) {
      errorMessage = "Fetching current location...";
      lct.LocationData? currentLocation =
          await mapController.getCurrentLocation();
      if (currentLocation == null) {
        errorMessage = "Unable to fetch current location. Please try again.";
        setLoading();
        return;
      }
    }

    var checkIn = DateConverter.convertDate(DateTime.now(),
        format: 'yyyy-MM-dd HH:mm:ss');
    try {
      if (user == null) await getUser();
      var data = dio.FormData.fromMap({
        "empid": user!.eId,
        "check_in": checkIn,
        "geo_checkin": jsonEncode({
          "lat": mapController.currentLocation!.latitude.toString(),
          "lon": mapController.currentLocation!.longitude.toString()
        }).toString(),
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

    if (mapController.currentLocation == null) {
      errorMessage = "Fetching current location...";
      lct.LocationData? currentLocation =
          await mapController.getCurrentLocation();
      if (currentLocation == null) {
        errorMessage = "Unable to fetch current location. Please try again.";
        setLoading();
        return;
      }
    }
    var updateId = await PrefData.getCheckInId();
    var checkOut = DateConverter.convertDate(DateTime.now(),
        format: 'yyyy-MM-dd HH:mm:ss');

    try {
      var data = dio.FormData.fromMap({
        "empid": user!.eId,
        "update_id": updateId,
        "check_out": checkOut,
        "geo_checkout": jsonEncode({
          "lat": mapController.currentLocation?.latitude.toString(),
          "lon": mapController.currentLocation?.longitude.toString()
        }),
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
              // clear save data in local storage
              PrefData.clearDayInVerificationData();
              hoursLogged.value = "00 hours 00 minutes";
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
    setLoading();
    var user = userController.user;
    try {
      await apiService
          .get(
        "${AppUrls.dayInStatusVerification}?emp_id=${user!.eId}",
      )
          .then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }
            dayInVerificationModel = DayInVerificationModel.fromJson(jsonData);
            if (dayInVerificationModel!.success ==
                StringConstants.apiSuccessStatus) {
              dayInVerificationDataFound.value = true;
              // save this day in verification data in local storage
              PrefData.saveDayInVerificationData(
                dayInVerificationModel!,
              );
              PrefData.saveCheckInId(dayInVerificationModel!.updateId!);
              getHoursLoggedTime();
            } else {
              dayInVerificationDataFound.value = false;
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }

  RxString hoursLogged = "00 hours 00 minutes".obs;
  void getHoursLoggedTime() {
    // subtract check in time from current time
    if (dayInVerificationModel != null &&
        dayInVerificationModel!.checkinTime != null) {
      var checkInTime = DateTime.parse(dayInVerificationModel!.checkinTime!);
      var currentTime = DateTime.now();
      var difference = currentTime.difference(checkInTime);
      int hours = difference.inHours;
      int minutes = difference.inMinutes % 60;
      hoursLogged.value = "$hours hours $minutes minutes";
    }
  }

  Future employeeGpsLog() async {
    var user = userController.user;

    if (mapController.currentLocation == null) {
      Constant.printValue("Current location is null, cannot log GPS data");
      return;
    }

    var batteryLevel = await getBatteryLevel();
    var deviceId = const Uuid().v4();
    try {
      var data = dio.FormData.fromMap({
        "emp_id": user!.eId,
        "timestamp": DateConverter.convertDate(DateTime.now(),
            format: 'yyyy-MM-dd HH:mm:ss'),
        "device_id": deviceId,
        "gps_coordinates": jsonEncode({
          "lat": mapController.currentLocation!.latitude.toString(),
          "lon": mapController.currentLocation!.longitude.toString()
        }),
        "battery_level": batteryLevel.toString()
      });
      await apiService.post(AppUrls.employeeGpsLog, data).then(
        (response) {
          Constant.printValue("Response of api is :  $response");
        },
      );
    } finally {}
  }

  Future getEmployeeList() async {
    setLoading();
    employeeList.clear();
    employeeListString.clear();
    var user = userController.user;
    try {
      var data = dio.FormData.fromMap({
        "login_id": user!.eId,
      });
      await apiService.post(AppUrls.getlistapi, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            for (var item in jsonData) {
              employeeList.add(Employee.fromJson(item));

              // Add employee name to the string list combine first and last name
              String employeeName = "${item['firstname']} ${item['lastname']}";
              employeeListString.add(employeeName);
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }

  Future regionBasedEmployeeList(String regionId) async {
    setLoading();

    try {
      var data = dio.FormData.fromMap({
        "region_id": regionId,
        "login_id": userController.user!.eId,
      });
      await apiService.post(AppUrls.getregionemployeelist, data).then(
        (response) {
          Constant.printValue(
              "Response of region based employee list api is :  $response");
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            regionBasedEmployees.clear();

            for (var item in jsonData) {
              regionBasedEmployees.add(RegionBasedEmployee.fromJson(item));

              // // Add employee name to the string list combine first and last name
              // String employeeName = "${item['firstname']} ${item['lastname']}";
              // employeeListString.add(employeeName);
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }

  Future employeeLiveRoute() async {
    try {
      setLoading();
      employeeLocation.clear();
      var user = await PrefData.getUser();
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

      var data = dio.FormData.fromMap({
        "emp_id": user!.eId,
        "date": formattedDate,
      });

      await apiService.post(AppUrls.getliveroute, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }
            for (var data in jsonData) {
              employeeLocation.add(EmployeeLocation.fromJson(data));
            }
          }
        },
      );
    } finally {
      setLoading();
      update();
    }
  }

  Future employeeRouteHistory({String? date}) async {
    try {
      setLoading();
      update();
      routeHistory.clear();
      var user = await PrefData.getUser();
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

      var data = dio.FormData.fromMap({
        "emp_id": user!.eId,
        "date": date ?? formattedDate,
      });
      await apiService.post(AppUrls.getemployeelivelog, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }
            for (var data in jsonData) {
              routeHistory.add(RouteHistory.fromJson(data));
            }
          }
        },
      );
    } finally {
      setLoading();
      update();
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

  Future<int> getBatteryLevel() async {
    final battery = Battery();
    final level = await battery.batteryLevel; // returns int (0 - 100)
    return level;
  }

  Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id; // UUID for Android
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor; // UUID for iOS
    }
    return deviceId;
  }
}

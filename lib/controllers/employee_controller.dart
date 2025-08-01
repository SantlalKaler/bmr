import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';

class EmployeeController extends GetxController {
  RxBool loading = false.obs;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;

  Future attendanceCheckIn() async {
    try {
      var data = {
        "empid": "",
        "check_in": "",
        "geo_checkin": "",
        "starting_meter": ""
      };

      Constant.printValue("Login data is $data");
      await apiService.post(AppUrls.createAttendance, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future attendanceCheckOut() async {
    try {
      var data = {
        "empid": "",
        "update_id": "",
        "check_out": "",
        "geo_checkout": "",
        "closing_meter": ""
      };

      Constant.printValue("Login data is $data");
      await apiService.post(AppUrls.updateAttendance, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
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

  Future resetEmployeeSession() async {
    try {
      var data = {
        "emp_id": "",
        "username": "",
        "password": "",
      };
      await apiService.post(AppUrls.resetemployeeloginapi, data).then(
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

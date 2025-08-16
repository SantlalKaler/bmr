import 'dart:convert';

import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/ui/constants/strings_constants.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';

class LeaveController extends GetxController {
  RxBool loading = false.obs;
  RxBool createLeaveSuccess = false.obs;

  String? errorMessage;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;

  Future getLeaveBalance(String empId) async {
    try {
      var data = {
        "emp_id": empId,
      };
      await apiService.post(AppUrls.getLeaveBalance, data).then(
        (response) {
          Constant.printValue("Response of getLeaveBalance API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future createLeaveRequest({
    required String empId,
    required String leaveType,
    required String purpose,
    required String leaveDays,
    required String fromDate,
    required String toDate,
  }) async {
    setLoading();
    try {
      var data = dio.FormData.fromMap({
        "emp_id": empId,
        "leave_type": leaveType,
        "purpose": purpose,
        "leave_days": leaveDays,
        "from_date": fromDate,
        "to_date": toDate,
      });
      await apiService.post(AppUrls.createLeaveRequest, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }
            if (jsonData['success'] == StringConstants.apiSuccessStatus) {
              createLeaveSuccess.value = true;
              errorMessage = null;
            } else {
              errorMessage =
                  jsonData['val'] ?? "Failed to create leave request";
              createLeaveSuccess.value = false;
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getLeaveApprovalList() async {
    setLoading();
    UserController userController = Get.find();
    try {
      var data = {
        "emp_id": userController.user!.eId!,
      };
      await apiService.post(AppUrls.getLeaveApprovalList, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }

  Future approveRejectLeaveRequest({
    required String empId,
    required String leaveId,
    required String status,
  }) async {
    try {
      var data = {
        "emp_id": empId,
        "leave_id": leaveId,
        "status": status,
      };
      await apiService.post(AppUrls.approveRejectLeaveRequest, data).then(
        (response) {
          Constant.printValue(
              "Response of approveRejectLeaveRequest API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }
}

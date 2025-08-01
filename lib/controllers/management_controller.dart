import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';

class ManagementController extends GetxController {
  RxBool loading = false.obs;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;

  Future getManagementRequests(String id) async {
    try {
      await apiService.get("${AppUrls.getManagementRequests}/$id").then(
        (response) {
          Constant.printValue(
              "Response of getManagementRequests API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future createManagementRequest({
    required String empId,
    required String deptId,
    required String reqDesc,
    required String comments,
    required String reqQty,
    required String expectBudget,
  }) async {
    try {
      var data = {
        "req_by": empId,
        "req_dep": deptId,
        "req_desc": reqDesc,
        "comments": comments,
        "req_qty": reqQty,
        "expected_budget": expectBudget,
      };
      await apiService.post(AppUrls.createManagementRequest, data).then(
        (response) {
          Constant.printValue(
              "Response of createManagementRequest API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future updateManagementRequest({
    required String cId,
    required String empId,
    required String deptId,
    required String reqDesc,
    required String comments,
    required String reqQty,
    required String expectBudget,
  }) async {
    try {
      var data = {
        "id": cId,
        "req_by": empId,
        "req_dep": deptId,
        "req_desc": reqDesc,
        "comments": comments,
        "req_qty": reqQty,
        "expected_budget": expectBudget,
      };
      await apiService.post(AppUrls.updateManagementRequest, data).then(
        (response) {
          Constant.printValue(
              "Response of updateManagementRequest API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future deleteManagementRequest(String requestId) async {
    try {
      var data = {
        "req_id": requestId,
      };
      await apiService.post(AppUrls.deleteManagementRequest, data).then(
        (response) {
          Constant.printValue(
              "Response of deleteManagementRequest API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getEmployeeDepartment(String id) async {
    try {
      await apiService.get("${AppUrls.getEmployeeDepartment}/$id").then(
        (response) {
          Constant.printValue(
              "Response of getEmployeeDepartment API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }
}

import 'dart:convert';

import 'package:bmr/controllers/customer_controller.dart';
import 'package:bmr/controllers/employee_controller.dart';
import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/ui/constants/strings_constants.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';
import '../ui/elements/app_snackbar.dart';
import '../ui/model/choice_chip_item.dart';

class TaskController extends GetxController {
  RxBool loading = false.obs;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;
  UserController userController = Get.find();

  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    print("Tab index changed to: $index");
    update();
  }

  List<ChoiceChipItem> items = [
    ChoiceChipItem(title: "BIKE"),
    ChoiceChipItem(title: "CAR"),
    ChoiceChipItem(title: "BUS"),
    ChoiceChipItem(title: "TRAIN"),
    ChoiceChipItem(title: "FLIGHT"),
    ChoiceChipItem(title: "MEETING"),
  ];

  RxInt selectedItem = 0.obs;
  void setSelectedItem(int index) {
    selectedItem.value = index;
    update();
  }

  String generateTaskId(String empId) {
    final now = DateTime.now();
    final formattedDateTime = "${now.year.toString().padLeft(4, '0')}"
        "${now.month.toString().padLeft(2, '0')}"
        "${now.day.toString().padLeft(2, '0')}"
        "${now.hour.toString().padLeft(2, '0')}"
        "${now.minute.toString().padLeft(2, '0')}"
        "${now.second.toString().padLeft(2, '0')}";
    return "$empId" "emp" "$formattedDateTime";
  }

  Future createTaskSummary(String description, String location, String taskType,
      String customerName, String transport, String employeeName) async {
    setLoading();

    CustomerController customerController = Get.find();
    EmployeeController employeeController = Get.find();

    var userId = userController.user!.eId;
    var currentDate = DateTime.now();
    var taskId = generateTaskId(userId.toString());
    var taskDate = DateFormat('yyyy-MM-dd').format(currentDate);
    var customerId = customerController.getCustomerIdByName(customerName);
    var employeeId = employeeController.getEmployeeIdByName(employeeName);

    try {
      var taskSchedule = [
        {
          "description": description,
          "emp_id": employeeId,
          "image": "",
          "location": location,
          "task_type": taskType,
          "time": currentDate,
          "transport": transport,
          "customer_id": customerId
        }
      ];
      var data = {
        "task_id": taskId,
        "task_date": taskDate,
        "created_by_id": userId,
        "approved_by": userId,
        "assigned_by_id": userId,
        "created_date": taskDate,
        "taskSchedule": taskSchedule,
      };

      Constant.printValue("Data of create task : ${data}");
      await apiService.post(AppUrls.createtasksummaryapi, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            if (jsonData['success'] == StringConstants.apiSuccessStatus) {
              AppSnackBar.showSnackBar(
                "Task created successfully",
              );
              // get tasks
              getCurrentDayTaskList();
            } else {
              AppSnackBar.showSnackBar(
                "Failed to create task",
              );
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }

  Future updateTaskSummary() async {
    try {
      var data = {
        "task_id": "",
        "td_id": "",
        "task_date": "",
        "created_by_id": "",
        "approved_by": "",
        "created_date": "",
        "taskSchedule": "",
      };
      await apiService.post(AppUrls.updatetasksummaryapi, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getTaskList() async {
    UserController userController = Get.find();
    var user = userController.user;
    var fromDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    var toDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    try {
      var data = dio.FormData.fromMap({
        "emp_id": user!.eId,
        "region_id": user.regionId,
        "from_date": fromDate,
        "to_date": toDate,
      });
      await apiService.post(AppUrls.getTaskList, data).then(
            (response) {},
          );
    } finally {
      setLoading();
    }
  }

  Future getPendingTaskApprovalList({
    required String empId,
    required String regionId,
    required String fromDate,
    required String toDate,
  }) async {
    try {
      var data = {
        "emp_id": empId,
        "region_id": regionId,
        "from_date": fromDate,
        "to_date": toDate,
      };
      await apiService.post(AppUrls.getPendingTaskApprovalList, data).then(
        (response) {
          Constant.printValue(
              "Response of getPendingTaskApprovalList API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getCurrentDayTaskList() async {
    setLoading();
    try {
      var user = userController.user;
      var empId = user!.eId;
      var regionId = user.regionId;
      var fromDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
      var toDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

      var data = dio.FormData.fromMap({
        "emp_id": empId,
        "region_id": regionId,
        "from_date": fromDate,
        "to_date": toDate,
      });
      await apiService.post(AppUrls.getCurrentDayTaskList, data).then(
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

  Future getPendingTaskList() async {
    setLoading();
    try {
      var userId = userController.user!.eId;
      var data = dio.FormData.fromMap({
        "emp_id": userId,
      });
      await apiService.post(AppUrls.getPendingTaskList, data).then(
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

  Future taskCheckIn({
    required String tdId,
    required String checkIn,
    required String geoCheckin,
    required String empId,
  }) async {
    try {
      var data = {
        "td_id": tdId,
        "check_in": checkIn,
        "geo_checkin": geoCheckin,
        "login_id": empId,
      };
      await apiService.post(AppUrls.taskCheckIn, data).then(
        (response) {
          Constant.printValue("Response of taskCheckIn API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future taskCheckOut({
    required String tdId,
    required String checkOut,
    required String geoCheckout,
    required String empId,
  }) async {
    try {
      var data = {
        "td_id": tdId,
        "check_out": checkOut,
        "geo_checkout": geoCheckout,
        "login_id": empId,
      };
      await apiService.post(AppUrls.taskCheckOut, data).then(
        (response) {
          Constant.printValue("Response of taskCheckOut API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future updateTaskStatus({
    required String userId,
    required String taskId,
    required String approvedStatus,
  }) async {
    try {
      var data = {
        "user_id": userId,
        "taskid": taskId,
        "approvedstatus": approvedStatus,
      };
      await apiService.post(AppUrls.updateTaskStatus, data).then(
        (response) {
          Constant.printValue("Response of updateTaskStatus API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getScheduleList() async {
    setLoading();
    var user = userController.user;
    try {
      var data = dio.FormData.fromMap({
        "login_id": user!.eId,
      });
      await apiService.post(AppUrls.getScheduleList, data).then(
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

  Future getTaskById({required String taskId}) async {
    try {
      var data = {
        "task_id": taskId,
      };
      await apiService.post(AppUrls.getTaskById, data).then(
        (response) {
          Constant.printValue("Response of getTaskById API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getTasksAssignedByMe({
    required String empId,
    required String assigneeType,
    required String priority,
    required String status,
  }) async {
    try {
      var data = {
        "emp_id": empId,
        "assignee_type": assigneeType,
        "priority": priority,
        "status": status,
      };
      await apiService.post(AppUrls.getTasksAssignedByMe, data).then(
        (response) {
          Constant.printValue(
              "Response of getTasksAssignedByMe api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future updateAssignedTask({
    required String taskId,
    required String taskName,
    required String status,
    required String priority,
    required String taskDue,
    required String taskNotes,
    required String assignedTo,
    required String assignedType,
    required String loginId,
  }) async {
    try {
      var data = {
        "task_id": taskId,
        "task_name": taskName,
        "status": status,
        "priority": priority,
        "task_due": taskDue,
        "task_notes": taskNotes,
        "assigned_to": assignedTo,
        "assigned_type": assignedType,
        "login_id": loginId,
      };
      await apiService.post(AppUrls.updateAssignedTask, data).then(
        (response) {
          Constant.printValue(
              "Response of updateAssignedTask api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }
}

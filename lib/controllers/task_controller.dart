import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';
import '../ui/model/choice_chip_item.dart';

class TaskController extends GetxController {
  RxBool loading = false.obs;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;

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

  Future createTaskSummary() async {
    try {
      var data = {
        "task_id": "",
        "task_date": "",
        "created_by_id": "",
        "approved_by": "",
        "assigned_by_id": "",
        "created_date": "",
        "taskSchedule": "",
      };
      await apiService.post(AppUrls.createtasksummaryapi, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
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
    try {
      var data = {
        "emp_id": "",
        "region_id": "",
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

  Future getCurrentDayTaskList({
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
      await apiService.post(AppUrls.getCurrentDayTaskList, data).then(
        (response) {
          Constant.printValue(
              "Response of getCurrentDayTaskList API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getPendingTaskList({required String empId}) async {
    try {
      var data = {
        "emp_id": empId,
      };
      await apiService.post(AppUrls.getPendingTaskList, data).then(
        (response) {
          Constant.printValue("Response of getPendingTaskList API: $response");
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

  Future getScheduleList(String loginId) async {
    try {
      var data = {
        "login_id": loginId,
      };
      await apiService.post(AppUrls.getScheduleList, data).then(
        (response) {
          Constant.printValue("Response of getScheduleList API: $response");
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

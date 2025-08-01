import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';

class TodoController extends GetxController {
  RxBool loading = false.obs;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;
  Future getTodoTasksList() async {
    try {
      await apiService.get(AppUrls.getTodoTasksList).then(
        (response) {
          Constant.printValue("Response of getTodoTasksList API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future createTodoTask({
    required String taskText,
    required String taskDue,
    required String taskNotes,
    required String createdBy,
  }) async {
    try {
      var data = {
        "task_text": taskText,
        "task_due": taskDue,
        "task_notes": taskNotes,
        "created_by": createdBy,
      };
      await apiService.post(AppUrls.createTodoTask, data).then(
        (response) {
          Constant.printValue("Response of createTodoTask API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future updateTodoTask({
    required String taskId,
    required String taskText,
    required String taskDue,
    required String taskNotes,
  }) async {
    try {
      var data = {
        "task_id": taskId,
        "task_text": taskText,
        "task_due": taskDue,
        "task_notes": taskNotes,
      };
      await apiService.post(AppUrls.updateTodoTask, data).then(
        (response) {
          Constant.printValue("Response of updateTodoTask api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future deleteTask({required String taskId}) async {
    try {
      var data = {
        "task_id": taskId,
      };
      await apiService.post(AppUrls.deleteTask, data).then(
        (response) {
          Constant.printValue("Response of deleteTask api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getMyTodoList({
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
      await apiService.post(AppUrls.getMyTodoList, data).then(
        (response) {
          Constant.printValue("Response of getMyTodoList api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future updateMyTodoTask({
    required String taskId,
    required String status,
    required String priority,
    required String taskNotes,
    required String loginId,
  }) async {
    try {
      var data = {
        "task_id": taskId,
        "status": status,
        "priority": priority,
        "task_notes": taskNotes,
        "login_id": loginId,
      };
      await apiService.post(AppUrls.updateMyTodoTask, data).then(
        (response) {
          Constant.printValue(
              "Response of updateMyTodoTask api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future createTodoTaskWithAssignment({
    required String taskText,
    required String status,
    required String priority,
    required String createdBy,
    required String taskDue,
    required String taskNotes,
    required String assignedTo,
    required String assignedType,
  }) async {
    try {
      var data = {
        "task_text": taskText,
        "status": status,
        "priority": priority,
        "created_by": createdBy,
        "task_due": taskDue,
        "task_notes": taskNotes,
        "assigned_to": assignedTo,
        "assigned_type": assignedType,
      };
      await apiService.post(AppUrls.createTodoTaskWithAssignment, data).then(
        (response) {
          Constant.printValue(
              "Response of createTodoTaskWithAssignment api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }
}

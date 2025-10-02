import 'dart:convert';

import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/data/api_services.dart';
import 'package:bmr/data/pref_data.dart';
import 'package:bmr/ui/constants/strings_constants.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../data/app_urls.dart';
import '../data/model/user.dart';
import '../ui/constants/constant.dart';

class AuthController extends GetxController {
  RxBool rememberMe = false.obs;
  RxBool loading = false.obs;
  RxBool dialogLoading = false.obs;
  RxBool loginSuccess = false.obs;
  RxBool resetSessionSuccess = false.obs;
  RxBool changePasswordSuccess = false.obs;
  String? errorMessage;

  ApiService apiService = ApiService();
  User? user;

  setLoading() => loading.value = !loading.value;
  setDialogLoading() => dialogLoading.value = !dialogLoading.value;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  Future login(String username, String password) async {
    setLoading();
    try {
      loginSuccess.value = false;
      var data = dio.FormData.fromMap(
          {"username": username, "password": password, "version_no": "2.7"});

      await apiService.post(AppUrls.login, data).then(
        (response) async {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            var userInfo = User.fromJson(jsonData);
            user = userInfo;
            if (userInfo.success == "1") {
              // save user in local
              if (rememberMe.isTrue) {
                await PrefData.saveUser(userInfo);
                UserController userController = Get.find();
                await userController.getUser();
              }
              loginSuccess.value = true;
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

  Future logout() async {
    try {
      var data = {"emp_id": ""};

      await apiService.post(AppUrls.logout, data).then(
        (response) async {
          Constant.printValue("Response of logout api is :  $response");
          await PrefData.clearUser();
        },
      );
    } finally {
      setLoading();
    }
  }

  Future changePassword(
      {required String username, required String newPassword}) async {
    setLoading();
    UserController userController = Get.find();
    var user = userController.user;
    try {
      var data = dio.FormData.fromMap(
          {"emp_id": user!.eId, "password": newPassword, "username": username});

      await apiService.post(AppUrls.changepasswordapi, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            if (jsonData['success'] == StringConstants.apiSuccessStatus) {
              changePasswordSuccess.value = true;
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }

  Future resetEmployeeSession(String username, String password) async {
    setDialogLoading();
    try {
      resetSessionSuccess.value = false;
      var data = dio.FormData.fromMap({
        "username": username,
        "password": password,
      });
      await apiService.post(AppUrls.resetemployeeloginapi, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            if (jsonData['success'] == StringConstants.apiSuccessStatus) {
              resetSessionSuccess.value = true;
            }
          }
        },
      );
    } finally {
      setDialogLoading();
    }
  }

  Future getUser() async {
    user = await PrefData.getUser();
  }
}

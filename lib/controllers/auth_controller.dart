import 'dart:convert';

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
  String? errorMessage;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;
  setDialogLoading() => dialogLoading.value = !dialogLoading.value;

  Future login(String username, String password) async {
    setLoading();
    try {
      loginSuccess.value = false;
      var data = dio.FormData.fromMap(
          {"username": username, "password": password, "version_no": "2.7"});

      await apiService.post(AppUrls.login, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            var user = User.fromJson(jsonData);
            if (user.success == "1") {
              // save user in local
              PrefData.saveUser(user);
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

  Future changePassword() async {
    try {
      var data = {"emp_id": "", "password": ""};

      await apiService.post(AppUrls.logout, data).then(
        (response) {
          Constant.printValue("Response of logout api is :  $response");
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
}

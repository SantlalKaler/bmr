import 'package:bmr/data/api_services.dart';
import 'package:bmr/data/pref_data.dart';
import 'package:get/get.dart';

import '../data/app_urls.dart';
import '../ui/constants/constant.dart';

class AuthController extends GetxController {
  RxBool rememberMe = false.obs;
  RxBool loading = false.obs;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;

  Future login(String username, String password) async {
    try {
      var data = {"username": username, "password": password, "version_no": ""};

      Constant.printValue("Login data is $data");
      await apiService.post(AppUrls.login, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
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
}

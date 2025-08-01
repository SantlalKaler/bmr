import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';

class CustomController extends GetxController {
  RxBool loading = false.obs;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;

  Future getDepartmentList() async {
    try {
      await apiService.get(AppUrls.getdepartmentlistapi).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getRegionList() async {
    try {
      var data = {
        "login_id": "",
      };
      await apiService.post(AppUrls.getregionlist, data).then(
        (response) {
          Constant.printValue("Response of Login api is :  $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getStateCityList() async {
    try {
      await apiService.get(AppUrls.getStateCityList).then(
        (response) {
          Constant.printValue(
              "Response of getStateCityList api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getDealersList(String regionId) async {
    try {
      await apiService
          .get("${AppUrls.getDealersList}?region_id=$regionId")
          .then(
        (response) {
          Constant.printValue("Response of getDealersList api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getZoneList() async {
    try {
      await apiService.get(AppUrls.getZoneList).then(
        (response) {
          Constant.printValue("Response of getZoneList API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }
}

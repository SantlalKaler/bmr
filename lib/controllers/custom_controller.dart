import 'dart:convert';

import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/data/model/StateItem.dart';
import 'package:bmr/data/model/Zone.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../data/model/dealer.dart';
import '../ui/constants/constant.dart';

class CustomController extends GetxController {
  RxBool loading = false.obs;
  RxBool zoneLoading = false.obs;
  RxBool stateLoading = false.obs;
  RxBool dealerLoading = false.obs;

  ApiService apiService = ApiService();

  RxList<Zone> zoneList = RxList();
  RxList<Zone> customerZoneList = RxList();
  RxList<Dealer> dealerList = RxList();
  RxList<String> dealerListSting = RxList();
  RxList<String> zoneListSting = RxList();

  RxList<StateItem> stateList = RxList();
  RxList<String> stateListSting = RxList();
  RxList<String> cityListSting = RxList();

  setLoading() => loading.value = !loading.value;
  setStateLoading() => stateLoading.value = !stateLoading.value;
  setZoneLoading() => zoneLoading.value = !zoneLoading.value;

  void getCityList(String stateName) {
    cityListSting.clear();
    for (var value in stateList) {
      if (value.stateName == stateName &&
          value.city != null &&
          value.city!.isNotEmpty) {
        cityListSting.addAll(value.city!);
      }
    }
  }

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
    setLoading();
    UserController userController = Get.find();
    customerZoneList.clear();
    try {
      var data = dio.FormData.fromMap({
        "login_id": userController.user!.eId,
      });

      await apiService.post(AppUrls.getregionlist, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            for (var value in jsonData) {
              customerZoneList.add(Zone.fromJson(value));
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getStateCityList() async {
    stateListSting.clear();
    stateList.clear();
    setStateLoading();
    try {
      await apiService.get(AppUrls.getStateCityList).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            for (var value in jsonData) {
              stateList.add(StateItem.fromJson(value));
              stateListSting.add(value['state_name']);
            }
          }
        },
      );
    } finally {
      setStateLoading();
    }
  }

  Future getDealersList(String regionId) async {
    dealerList.clear();
    dealerListSting.clear();
    dealerLoading.value = true;
    try {
      await apiService
          .get("${AppUrls.getDealersList}?region_id=$regionId")
          .then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            for (var value in jsonData) {
              dealerList.add(Dealer.fromJson(value));
              dealerListSting.add(value['first_name']);
            }
          }
        },
      );
    } finally {
      dealerLoading.value = false;
    }
  }

  Future getZoneList() async {
    zoneList.clear();
    zoneListSting.clear();
    setZoneLoading();
    try {
      await apiService.get(AppUrls.getZoneList).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            for (var value in jsonData) {
              zoneList.add(Zone.fromJson(value));
              zoneListSting.add(value['zone_name']);
            }
          }
        },
      );
    } finally {
      setZoneLoading();
    }
  }
}

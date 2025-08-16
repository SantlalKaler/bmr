import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';
import '../ui/constants/strings_constants.dart';

class SamplingController extends GetxController {
  RxBool loading = false.obs;

  ApiService apiService = ApiService();
  String? errorMessage;
  setLoading() => loading.value = !loading.value;

  Future createSampling({
    required String cycleId,
    required String empId,
    required String dailyFeed,
    required String recordedDate,
    required String sampleHarvestFlag,
    required String abw,
    required String samplingDate,
  }) async {
    try {
      var data = {
        "cycle_id": cycleId,
        "emp_id": empId,
        "daily_feed": dailyFeed,
        "recorded_date": recordedDate,
        "sample_harvest_flag": sampleHarvestFlag,
        "abw": abw,
        "sampling_date": samplingDate,
      };
      await apiService.post(AppUrls.createSampling, data).then(
        (response) {
          Constant.printValue("Response of createSampling API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future updateSampling({
    required String sampleId,
    required String empId,
    required String dailyFeed,
    required String recordedDate,
    required String sampleHarvestFlag,
    required String abw,
  }) async {
    try {
      var data = {
        "sample_id": sampleId,
        "emp_id": empId,
        "daily_feed": dailyFeed,
        "recorded_date": recordedDate,
        "sample_harvest_flag": sampleHarvestFlag,
        "abw": abw,
      };
      await apiService.post(AppUrls.updateSampling, data).then(
        (response) {
          Constant.printValue("Response of updateSampling API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future checkActiveCycle({
    required String pondId,
    required String custId,
  }) async {
    try {
      var data = {
        "pond_id": pondId,
        "cust_id": custId,
      };
      await apiService.post(AppUrls.checkActiveCycle, data).then(
        (response) {
          Constant.printValue("Response of checkActiveCycle API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getSampleHistory({
    required String custId,
    required String cycleId,
    required String pondId,
    required String request,
  }) async {
    try {
      setLoading();
      var data = dio.FormData.fromMap({
        "cust_id": custId,
        "cycle_id": cycleId,
        "pond_id": pondId,
        "request": request,
      });
      await apiService.post(AppUrls.getSampleHistory, data).then(
        (response) {
          Constant.printValue("Response of getSampleHistory API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future createSamplingWithFile({
    required String taskId,
    required String pondId,
    required String custId,
    required String cycleId,
    required String empId,
    required String newCycle,
    required String cultureSeedDate,
    required String doc,
    required String stockingDate,
    required String seedStocking,
    required String ph,
    required String abw,
    required String salinity,
    required String samplingDate,
    required String dailyFeed,
    required String adg,
    required String filePath,
  }) async {
    try {
      setLoading();
      var formData = dio.FormData.fromMap({
        "task_id": taskId,
        "pond_id": pondId,
        "cust_id": custId,
        "cycle_id": cycleId,
        "emp_id": empId,
        "new_cycle": newCycle,
        "culture_seed_date": cultureSeedDate,
        "doc": doc,
        "stocking_date": stockingDate,
        "seed_stocking": seedStocking,
        "ph": ph,
        "abw": abw,
        "salinity": salinity,
        "sampling_date": samplingDate,
        "daily_feed": dailyFeed,
        "adg": adg,
        "sampling_file":
            filePath.isEmpty ? "" : await dio.MultipartFile.fromFile(filePath),
      });

      await apiService.post(AppUrls.createSampling, formData).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
              if (jsonData['success'].toString() ==
                  StringConstants.apiSuccessStatus) {
                errorMessage = null;
              } else {
                errorMessage =
                    jsonData['message'] ?? StringConstants.somethingWentWrong;
              }
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }
}

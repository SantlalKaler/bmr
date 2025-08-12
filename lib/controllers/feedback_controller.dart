import 'dart:convert';

import 'package:bmr/ui/constants/strings_constants.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';

class FeedbackController extends GetxController {
  RxBool loading = false.obs;
  RxBool formSubmitSuccess = false.obs;

  ApiService apiService = ApiService();
  String? errorMessage;

  setLoading() => loading.value = !loading.value;

  Future getFeedbackQuestions(String type) async {
    try {
      await apiService.get("${AppUrls.getFeedbackQuestions}?type=$type").then(
        (response) {
          Constant.printValue(
              "Response of getFeedbackQuestions API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future submitFeedback({
    required String tdId,
    required String fbSubmitTime,
    required String fbGeoJson,
    required String feedback,
    required String loginId,
    required String fbComments,
  }) async {
    try {
      var data = {
        "td_id": tdId,
        "fb_submit_time": fbSubmitTime,
        "fb_geo_json": fbGeoJson,
        "feedBack": feedback,
        "login_id": loginId,
        "fb_comments": fbComments,
      };
      await apiService.post(AppUrls.submitFeedback, data).then(
        (response) {
          Constant.printValue("Response of submitFeedback API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future physicalTest({
    String? taskId,
    String? loginId,
    String? datetime,
    String? powderHg12,
    String? hg3s3p4s45,
    String? pride3p4s4,
    String? fcr,
    String? moldsInfection,
    String? fibrous,
    String? stitchingProblem,
    String? feedSinkingTime,
    String? farmerId,
    String? pondId,
    String? comments,
  }) async {
    setLoading();
    try {
      var data = dio.FormData.fromMap({
        "task_id": taskId,
        "login_id": loginId,
        "datetime": datetime,
        "powder_hg_1_2": powderHg12,
        "hg3s_3p_4s_4_5": hg3s3p4s45,
        "pride3p_4s_4": pride3p4s4,
        "fcr": fcr,
        "molds_infection": moldsInfection,
        "fibrous": fibrous,
        "stichingproblem": stitchingProblem,
        "feedsinkingtime": feedSinkingTime,
        "farmer_id": farmerId,
        "pond_id": pondId,
        "comments": comments,
      });
      await apiService.post(AppUrls.physicalTest, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            if (jsonData['success'] == StringConstants.apiSuccessStatus) {
              formSubmitSuccess.value = true;
              errorMessage = null;
            } else {
              formSubmitSuccess.value = false;
              errorMessage = jsonData['val'];
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }

  Future technicalTest({
    String? taskId,
    String? loginId,
    String? datetime,
    String? farmerId,
    String? pondId,
    String? waterSources,
    String? pumping,
    String? treatment,
    String? checkTrayFeedQty,
    String? sedimentationTank,
    String? preTreatmentAvailable,
    String? fencingAndDisinfectants,
    String? appliedAnyFermentation,
    String? probioticSupplementation,
    String? aeratorsChlorinationAfterCrap,
    String? comments,
  }) async {
    setLoading();
    try {
      var data = dio.FormData.fromMap({
        "task_id": taskId ?? "",
        "login_id": loginId ?? "",
        "datetime": datetime ?? "",
        "farmer_id": farmerId ?? "",
        "pond_id": pondId ?? "",
        "water_sources": waterSources ?? "",
        "pumping": pumping ?? "",
        "treatment": treatment ?? "",
        "check_tray_feed_qty": checkTrayFeedQty ?? "",
        "sedimentation_tank": sedimentationTank ?? "",
        "pre_treatment_available": preTreatmentAvailable ?? "",
        "fencing_and_disinfectants": fencingAndDisinfectants ?? "",
        "applied_any_fermentation": appliedAnyFermentation ?? "",
        "probiotic_supplementation": probioticSupplementation ?? "",
        "aerators_chlorination_after_crap": aeratorsChlorinationAfterCrap ?? "",
        "comments": comments ?? "",
      });
      await apiService.post(AppUrls.technicalTest, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            if (jsonData['success'] == StringConstants.apiSuccessStatus) {
              formSubmitSuccess.value = true;
              errorMessage = null;
            } else {
              formSubmitSuccess.value = false;
              errorMessage = jsonData['val'];
            }
          }
        },
      );
    } finally {
      setLoading();
    }
  }
}

import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';

class FeedbackController extends GetxController {
  RxBool loading = false.obs;

  ApiService apiService = ApiService();

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
    required String taskId,
    required String loginId,
    required String datetime,
    required String powderHg12,
    required String hg3s3p4s45,
    required String pride3p4s4,
    required String fcr,
    required String moldsInfection,
    required String fibrous,
    required String stitchingProblem,
    required String feedSinkingTime,
    required String farmerId,
    required String pondId,
    required String comments,
  }) async {
    try {
      var data = {
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
      };
      await apiService.post(AppUrls.physicalTest, data).then(
        (response) {
          Constant.printValue("Response of physicalTest API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future technicalTest({
    required String taskId,
    required String loginId,
    required String datetime,
    required String farmerId,
    required String pondId,
    required String waterSources,
    required String pumping,
    required String treatment,
    required String checkTrayFeedQty,
    required String sedimentationTank,
    required String preTreatmentAvailable,
    required String fencingAndDisinfectants,
    required String appliedAnyFermentation,
    required String probioticSupplementation,
    required String aeratorsChlorinationAfterCrap,
    required String comments,
  }) async {
    try {
      var data = {
        "task_id": taskId,
        "login_id": loginId,
        "datetime": datetime,
        "farmer_id": farmerId,
        "pond_id": pondId,
        "water_sources": waterSources,
        "pumping": pumping,
        "treatment": treatment,
        "check_tray_feed_qty": checkTrayFeedQty,
        "sedimentation_tank": sedimentationTank,
        "pre_treatment_available": preTreatmentAvailable,
        "fencing_and_disinfectants": fencingAndDisinfectants,
        "applied_any_fermentation": appliedAnyFermentation,
        "probiotic_supplementation": probioticSupplementation,
        "aerators_chlorination_after_crap": aeratorsChlorinationAfterCrap,
        "comments": comments,
      };
      await apiService.post(AppUrls.technicalTest, data).then(
        (response) {
          Constant.printValue("Response of technicalTest API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }
}

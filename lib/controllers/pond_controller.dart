import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';

class PondController extends GetxController {
  RxBool loading = false.obs;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;

  Future createPond({
    required String empId,
    required String custId,
    required String pondId,
    required String comments,
    required String size,
    required String density,
    required String pondRefer,
    required String status,
    required String wsa,
    required String salinity,
    required String seedStocking,
    required String ph,
    required String stockingDate,
    required String recordedDate,
  }) async {
    try {
      var data = {
        "emp_id": empId,
        "cust_id": custId,
        "pond_id": pondId,
        "comments": comments,
        "size": size,
        "density": density,
        "pond_refer": pondRefer,
        "status": status,
        "wsa": wsa,
        "salinity": salinity,
        "seed_stocking": seedStocking,
        "ph": ph,
        "stocking_date": stockingDate,
        "recorded_date": recordedDate,
      };
      await apiService.post(AppUrls.createPond, data).then(
        (response) {
          Constant.printValue("Response of createPond API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future updatePond({
    required String empId,
    required String custId,
    required String pondId,
    required String cycleId,
    required String custPondId,
    required String comments,
    required String size,
    required String density,
    required String pondRefer,
    required String status,
    required String wsa,
    required String seedStocking,
    required String ph,
    required String salinity,
    required String stockingDate,
    required String recordedDate,
  }) async {
    try {
      var data = {
        "emp_id": empId,
        "cust_id": custId,
        "pondid": pondId,
        "cycle_id": cycleId,
        "pond_id": custPondId,
        "comments": comments,
        "size": size,
        "density": density,
        "pond_refer": pondRefer,
        "status": status,
        "wsa": wsa,
        "seed_stocking": seedStocking,
        "ph": ph,
        "salinity": salinity,
        "stocking_date": stockingDate,
        "recorded_date": recordedDate,
      };
      await apiService.post(AppUrls.updatePond, data).then(
        (response) {
          Constant.printValue("Response of updatePond API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getPondList(String customerId) async {
    try {
      await apiService
          .get("${AppUrls.getPondList}?cust_id=$customerId")
          .then((response) {
        Constant.printValue("Response of getPondList API: $response");
      });
    } finally {
      setLoading();
    }
  }

  Future getPondDetails({
    required String cycleId,
    required String pondId,
  }) async {
    try {
      var data = {
        "cycle_id": cycleId,
        "pondid": pondId,
      };
      await apiService.post(AppUrls.getPondDetails, data).then(
        (response) {
          Constant.printValue("Response of getPondDetails API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future getPondSamplingList(String customerId) async {
    try {
      var data = {
        "cust_id": customerId,
      };
      await apiService.post(AppUrls.getPondSamplingList, data).then(
        (response) {
          Constant.printValue("Response of getPondSamplingList API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }
}

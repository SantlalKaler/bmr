import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';

class HarvesterController extends GetxController {
  RxBool loading = false.obs;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;
  Future createHarvest({
    required String taskId,
    required String cycleId,
    required String empId,
    required String pondId,
    required String custId,
    required String harvestDate,
    required String sampleHarvestFlag,
    required String dailyFeed,
    required String abw,
    required String survival,
    required String ph,
    required String salinity,
    required String eBiomass,
    required String aBiomass,
    required String density,
    required String adg,
    required String fcr,
    required String productivity,
    required String qty,
    required String seedSource,
    required String doc,
    required String acres,
    required String totalFeed,
    required String filePath,
  }) async {
    try {
      var formData = dio.FormData.fromMap({
        "task_id": taskId,
        "cycle_id": cycleId,
        "emp_id": empId,
        "pond_id": pondId,
        "cust_id": custId,
        "harvest_date": harvestDate,
        "sample_harvest_flag": sampleHarvestFlag,
        "daily_feed": dailyFeed,
        "abw": abw,
        "survival": survival,
        "ph": ph,
        "salinity": salinity,
        "e_biomass": eBiomass,
        "a_biomass": aBiomass,
        "density": density,
        "adg": adg,
        "fcr": fcr,
        "productivity": productivity,
        "qty": qty,
        "seed_source": seedSource,
        "doc": doc,
        "acres": acres,
        "total_feed": totalFeed,
        "sampling_file": await dio.MultipartFile.fromFile(filePath),
      });

      await apiService.post(AppUrls.createHarvest, formData).then(
        (response) {
          Constant.printValue("Response of createHarvest API: $response");
        },
      );
    } finally {
      setLoading();
    }
  }
}

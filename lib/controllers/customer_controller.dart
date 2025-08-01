import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';

class CustomerController extends GetxController {
  RxBool loading = false.obs;

  ApiService apiService = ApiService();

  setLoading() => loading.value = !loading.value;

  Future getCustomerList(String empId) async {
    try {
      var data = {
        "login_id": empId,
      };
      await apiService.post(AppUrls.getCustomerList, data).then(
        (response) {
          Constant.printValue("Response of getCustomerList api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future createCustomer({
    required String contactNo,
    required String category,
    required String firstname,
    required String lastname,
    required String address1,
    required String address2,
    required String city,
    required String state,
    required String zone,
    required String comments,
    required String custType,
    required String customerOf,
    required String status,
  }) async {
    try {
      var data = {
        "contact_no": contactNo,
        "customercategory": category,
        "firstname": firstname,
        "lastname": lastname,
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "zone": zone,
        "comments": comments,
        "cust_type": custType,
        "customerof": customerOf,
        "status": status,
      };
      await apiService.post(AppUrls.createCustomer, data).then(
        (response) {
          Constant.printValue("Response of createCustomer api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future updateCustomer({
    required String custId,
    required String contactNo,
    required String category,
    required String firstname,
    required String lastname,
    required String address1,
    required String address2,
    required String city,
    required String state,
    required String zone,
    required String comments,
    required String custType,
    required String customerOf,
    required String status,
  }) async {
    try {
      var data = {
        "custid": custId,
        "contact_no": contactNo,
        "customercategory": category,
        "firstname": firstname,
        "lastname": lastname,
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "zone": zone,
        "comments": comments,
        "cust_type": custType,
        "customerof": customerOf,
        "status": status,
      };
      await apiService.post(AppUrls.updateCustomer, data).then(
        (response) {
          Constant.printValue("Response of updateCustomer api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  Future checkCustomerDetails({
    required String empId,
    required String mobile,
  }) async {
    try {
      var data = {
        "emp_id": empId,
        "mobile": mobile,
      };
      await apiService.post(AppUrls.checkCustomerDetails, data).then(
        (response) {
          Constant.printValue(
              "Response of checkCustomerDetails api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }
}

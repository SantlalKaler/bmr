import 'dart:convert';

import 'package:bmr/controllers/user_controller.dart';
import 'package:bmr/data/model/customer.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../data/api_services.dart';
import '../data/app_urls.dart';
import '../ui/constants/constant.dart';
import '../ui/model/choice_chip_item.dart';

class CustomerController extends GetxController {
  RxBool loading = false.obs;
  RxBool createFarmerSuccess = false.obs;
  String? errorMessage;

  ApiService apiService = ApiService();

  Rxn<String> selectedZone = Rxn<String>();
  Rxn<String> selectedState = Rxn<String>();
  Rxn<String> selectedCity = Rxn<String>();
  RxInt selectedOwnOthers = 0.obs;
  RxInt selectedFarmerDealer = 0.obs;
  RxInt selectedActiveInactive = 0.obs;
  RxList<Customer> customers = RxList();

  List<ChoiceChipItem> ownOthers = [
    ChoiceChipItem(title: "OWN"),
    ChoiceChipItem(title: "OTHERS"),
  ];
  List<ChoiceChipItem> farmerDealer = [
    ChoiceChipItem(title: "FARMERS"),
    ChoiceChipItem(title: "DEALERS"),
  ];
  List<ChoiceChipItem> activeInactive = [
    ChoiceChipItem(title: "ACTIVE"),
    ChoiceChipItem(title: "INACTIVE"),
  ];

  setLoading() => loading.value = !loading.value;

  UserController userController = Get.find();

  Future getCustomerList() async {
    setLoading();
    var user = userController.user;
    try {
      var data = dio.FormData.fromMap({
        "login_id": user!.eId,
      });
      await apiService.post(AppUrls.getCustomerList, data).then(
        (response) {
          Constant.printValue("Response of getCustomerList api is : $response");
        },
      );
    } finally {
      setLoading();
    }
  }

  String? getCustomerIdByName(String name) {
    return customers
        .firstWhere(
          (c) =>
              "${c.firstName ?? ''} ${c.lastName ?? ''}".trim().toLowerCase() ==
              name.trim().toLowerCase(),
          orElse: () => Customer(id: null),
        )
        .id;
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
    setLoading();
    try {
      var data = dio.FormData.fromMap({
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
      });
      await apiService.post(AppUrls.createCustomer, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            if (jsonData['success'] == 1) {
              createFarmerSuccess.value = true;
              errorMessage = null;
            } else {
              createFarmerSuccess.value = false;
              errorMessage = jsonData['success_message'];
            }
          }
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

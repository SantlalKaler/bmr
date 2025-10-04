import 'dart:convert';

import 'package:bmr/controllers/custom_controller.dart';
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
  RxBool mobileAlreadyRegistered = false.obs;
  String? errorMessage;
  Customer? selectedCustomer;

  ApiService apiService = ApiService();

  Rxn<String> selectedZone = Rxn<String>();
  Rxn<String> selectedState = Rxn<String>();
  Rxn<String> selectedDealer = Rxn<String>();
  Rxn<String> selectedCity = Rxn<String>();
  RxInt selectedOwnOthers = 0.obs;
  RxInt selectedFarmerDealer = 0.obs;
  RxInt selectedActiveInactive = 0.obs;
  RxList<Customer> customers = RxList();
  RxList<String> customersStringList = RxList();
  RxList<String> customersStringFilterList = <String>[].obs;

  // create a observable list of choice chip items

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
    customers.clear();
    customersStringList.clear();
    var user = userController.user;
    try {
      var data = dio.FormData.fromMap({
        "login_id": userController.user!.eId!,
      });
      await apiService.post(AppUrls.getCustomerList, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            for (var cust in jsonData) {
              customers.add(Customer.fromJson(cust));
              // if customer first and last name is not empty then add them
              // to the customersStringList
              if (cust['first_name'] != null &&
                  cust['last_name'] != null &&
                  cust['first_name'].isNotEmpty &&
                  cust['last_name'].isNotEmpty) {
                customersStringList.add(
                  "${cust['first_name']} ${cust['last_name']}".trim(),
                );
              }
            }

            Constant.printValue(
                "Customer list size : ${customersStringList.length}");
          }
          customersStringFilterList.value = customersStringList;
        },
      );
    } finally {
      setLoading();
    }
  }

  String? getSelectedZoneId({String? selectedZoneValue}) {
    CustomController customController = Get.find();
    final selected = selectedZoneValue ?? selectedZone.value;
    if (selected == null) return null;

    final matchedZone = customController.zoneList.firstWhereOrNull(
      (zone) => zone.zoneName == selected,
    );

    Constant.printValue(
        "Matched Zone: ${matchedZone?.id}\n Match zone name : ${matchedZone?.zoneName}\n Selected Zone: $selected");

    return matchedZone?.id;
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
              errorMessage = jsonData['val'];
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
      var data = dio.FormData.fromMap({
        "emp_id": empId,
        "mobile": mobile,
      });
      await apiService.post(AppUrls.checkCustomerDetails, data).then(
        (response) {
          if (response != null) {
            var jsonData = response.data;
            if (jsonData is String) {
              jsonData = json.decode(jsonData);
            }

            if (jsonData['success'] == 1) {
              mobileAlreadyRegistered.value = false;
              errorMessage = null;
            } else {
              mobileAlreadyRegistered.value = true;
              errorMessage = jsonData['success_message'];
            }
          }
        },
      );
    } finally {}
  }
}

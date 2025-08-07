import 'package:bmr/data/pref_data.dart';
import 'package:get/get.dart';

import '../data/model/user.dart';

class UserController extends GetxController {
  User? user;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUser();
  }

  Future getUser() async {
    user = await PrefData.getUser();
  }
}

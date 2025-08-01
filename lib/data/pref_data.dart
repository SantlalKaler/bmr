import 'package:shared_preferences/shared_preferences.dart';

import '../ui/constants/constant.dart';

class PrefData {
  static String prefName = "com.example.learn_management_app_ui";

  static String isIntro = "${prefName}isIntro";
  static String inSignIn = "${prefName}isSignIn";
  static String user = "user";
  static String deviceToken = "deviceToken";
  static String appsFlyer = "appsFlyer";
  static String location = "location";
  static String settings = "settings";
  static String authToken = "authToken";
  static String userId = "userId";

  static setIsIntro(bool sizes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isIntro, sizes);
  }

  static getIsIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool intValue = prefs.getBool(isIntro) ?? true;
    return intValue;
  }

  static getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(inSignIn) ?? false;
  }

  static setLoginStatus(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(inSignIn, isFav);
  }

  static clearUser() async {
    var token = await getDeviceToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    saveDeviceToken(token);
    // saveUserAddress(address!);
  }

  static saveDeviceToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(deviceToken, value);
  }

  static Future<String> getDeviceToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenValue = prefs.getString(deviceToken) ?? '';
    Constant.printValue("Token is : $tokenValue");
    return tokenValue;
  }
}

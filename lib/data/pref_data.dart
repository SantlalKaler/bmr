import 'package:shared_preferences/shared_preferences.dart';

import '../ui/constants/constant.dart';
import 'model/user.dart';

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

  static Future<void> saveUser(User userObj) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = userToJson(userObj); // Convert User to JSON string
    await prefs.setString(user, userJson);
    getUser();
  }

  /// Get user object
  static Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(user);

    Constant.printValue("User Saved in local is : $userJson");
    if (userJson == null || userJson.isEmpty) return null;
    return userFromJson(userJson);
  }
}

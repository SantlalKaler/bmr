import 'package:shared_preferences/shared_preferences.dart';

import '../ui/constants/constant.dart';
import 'model/user.dart';

class PrefData {
  static String prefName = "com.example.learn_management_app_ui";

  static String user = "user";
  static String deviceToken = "deviceToken";

  static String checkInId = "checkInId";

  static clearUser() async {
    // var token = await getDeviceToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // saveDeviceToken(token);
  }

  // token
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

  // check in id
  static saveCheckInId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(checkInId, value);
  }

  static Future<String> getCheckInId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(checkInId) ?? '';
    Constant.printValue("check in id is : $value");
    return value;
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

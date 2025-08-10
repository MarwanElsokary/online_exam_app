import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveToken(String token) {
    return prefs.setString("token", token);
  }

  static String? getToken() {
    return prefs.getString("token");
  }

  static Future<void> clearToken() async {
    await prefs.remove("token");
  }
}

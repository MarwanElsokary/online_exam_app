import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class PrefsHelper {
  static late SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> SaveToken(String token) {
    return prefs!.setString("token", token);
  }

  static String? getToken() {
    return prefs!.getString("token");
  }

  static cleartoken() {
    prefs!.remove("token");
  }
}
//  import 'package:shared_preferences/shared_preferences.dart';
//
// class PrefsHelper {
//   static const String _tokenKey = 'user_token';
//
//   static Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_tokenKey, token);
//   }
//
//   static Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_tokenKey);
//   }
//
//   static Future<void> clearToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_tokenKey);
//   }
//
//   static Future<void> clearAll() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
// }

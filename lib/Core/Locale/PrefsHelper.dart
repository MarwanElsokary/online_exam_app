import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
 static late SharedPreferences? prefs;
  static Future<void>init()async{
    prefs= await SharedPreferences.getInstance();
  }
    static Future<bool>SaveToken(String token){
   return prefs!.setString("token", token);
  }
  String? getToken(){
     return prefs!.getString("token");
  }
  static cleartoken(){
    prefs!.remove("token");
  }
}
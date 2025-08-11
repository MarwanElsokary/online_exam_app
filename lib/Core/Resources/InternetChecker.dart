import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {
  static Connectivity connectivity=Connectivity();
  static Future<bool> CheckNetwork()async{
    List<ConnectivityResult>connections=(await connectivity.checkConnectivity()) as List<ConnectivityResult>;
    if(connections.contains(ConnectivityResult.wifi)||connections.contains(ConnectivityResult.mobile)){
      return true;
    }
    return false;
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnection {
  InternetConnection._();

  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }
    return true;
  }
}

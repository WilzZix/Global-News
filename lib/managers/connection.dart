import 'package:connectivity/connectivity.dart';

class NoInternetException implements Exception {}

Future<bool> checkInternetConnection({throwError: false}) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  bool result = connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi;
  if (throwError && result == false) {
    throw new NoInternetException();
  }
  return result;
}

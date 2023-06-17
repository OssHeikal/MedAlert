import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnection {
  final Connectivity _connectivity = Connectivity();
  Future<bool> isConnected() async {
    final ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else {
      return false;
    }
  }
}

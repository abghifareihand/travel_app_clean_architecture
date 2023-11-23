import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> isConected();
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);
  @override
  Future<bool> isConected() async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../di.dart';

abstract class ConnectivityCheck {
  static Future<bool> call() async {
    var connectivityResult = await (Di.connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  static Stream<ConnectivityResult> get connectionStream {
    return Di.connectivity.onConnectivityChanged;
  }
}

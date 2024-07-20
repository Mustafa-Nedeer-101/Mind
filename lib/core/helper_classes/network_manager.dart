import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class NetworkManager {
  static final Connectivity _connectivity = Connectivity();

  // Check Internet Status
  static Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();

      if (result.last == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }
}

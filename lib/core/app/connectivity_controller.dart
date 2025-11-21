import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  /// Private constructor
  ConnectivityController._();

  /// Static instance
  static final ConnectivityController instance = ConnectivityController._();

  /// Notifier for connection status
  ValueNotifier<bool> isConnected = ValueNotifier(true);

  /// Initialize connectivity monitoring
  Future<void> init() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    log('ConnectivityController.instance.isConnected');

// This condition is for demo purposes only to explain every connection type.
// Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      isConnected.value = true;
      // Mobile network available.
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      isConnected.value = true;
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      isConnected.value = true;
      // Ethernet connection available.
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      isConnected.value = true;
      // Vpn connection active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
    } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      isConnected.value = true;
      // Bluetooth connection available.
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      isConnected.value = true;
      // Connected to a network which is not in the above mentioned networks.
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      isConnected.value = false;
      // No available network types
    }
   /* final result = await Connectivity().checkConnectivity();
    isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen(isInternetConnected);*/
  }

  /// Handle connectivity changes
  bool isInternetConnected(ConnectivityResult? connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      isConnected.value = false;
      return false;
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnected.value = true;
      return true;
    }
    return false;
  }
}

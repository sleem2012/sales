import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../api_client/connection_ckecker.dart';
import '../../error/failures.dart';
import '../../theme/logger.dart';

class KLocationService {
  static Future<Either<KFailure, Position>> call() async {
    bool connected = await ConnectivityCheck.call();

    if (connected) {
      bool serviceEnabled;
      LocationPermission permission;
      debugPrint('======== LocationService========= is connected ');
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      debugPrint('======== LocationService========= serviceEnabled $serviceEnabled ');

      if (!serviceEnabled) {
        return left(const KFailure.locationDisabled());
      }
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return left(const KFailure.locationDenied());
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return left(const KFailure.locationDeniedPermanently());
      }
      debugPrint('======== LocationService ========= permission ${permission.name} ');
      late Position? pos;
      try {
        pos = await Geolocator.getCurrentPosition(timeLimit: const Duration(seconds: 5));
      } catch (e) {
        pos = await Geolocator.getLastKnownPosition();
      }
      debugPrint('======== LocationService ========= getCurrentPosition ');
      printMap(pos?.toJson());

      return pos != null ? right(pos) : left(const KFailure.error("Couldn't get Location"));
    } else {
      return left(const KFailure.offline());
    }
  }
}

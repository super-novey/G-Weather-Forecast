import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationRepository {
  static LocationRepository get instance => Get.find();
  var currentPosition = Rxn<Position>();
  var isLoading = false.obs;
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    isLoading.value = true;

    try {
      final hasPermission = await handleLocationPermission();
      if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        currentPosition.value = position;
      }).catchError((e) {
        debugPrint(e);
      });
    } finally {
      isLoading.value = false;
    }
  }

  String get formattedPosition =>
      "${currentPosition.value!.latitude},${currentPosition.value!.longitude}";
}

import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/location_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'service_location.dart';

class LocationDataController extends GetxController {
  static var isLoading = true.obs;
  static var locationData = LocationData().obs;

  @override
  void onInit() {
    super.onInit();
  }

  static Future fetchLocationData(LatLng latlng) async {
    try {
      isLoading(true);
      var LocationData = await LocationService.convertLatLngToLocation(latlng);
      if (LocationData != null) {
        locationData.value = LocationData;
      }
    } finally {
      isLoading(false);
    }
  }
}

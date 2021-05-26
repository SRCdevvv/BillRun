import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/location_model.dart';
import 'service_location.dart';

class LocationDataController extends GetxController {
  static var isLoading = true.obs;
  static var locationData = LocationData().obs;

  @override
  void onInit() {
    fetchLocationData();
    super.onInit();
  }

  static Future fetchLocationData() async {
    try {
      isLoading(true);
      var LocationData = await LocationService.fetchLocation();

      if (LocationData != null) {
        locationData.value = LocationData;
      }
    } finally {
      isLoading(false);
    }
  }
}

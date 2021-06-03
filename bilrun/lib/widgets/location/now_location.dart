import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NowLocationService {
  static LatLng returnLatLng;
  static Future<LatLng> loadNowLocation() async {
    var currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    double nowLat = currentPosition.latitude;
    double nowLng = currentPosition.longitude;

    returnLatLng = LatLng(nowLat, nowLng);
    return returnLatLng;
  }
}

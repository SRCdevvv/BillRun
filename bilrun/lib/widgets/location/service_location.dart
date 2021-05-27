import 'dart:convert';
import 'package:bilrun/widgets/etc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/location_model.dart';

class LocationService {
  String si;
  String dong;
  String detail;
  static String address;
  static double long;
  static double lat;

  static Future loadLocation() async {}

  static Future<LocationData> fetchLocation() async {
    var currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    long = currentPosition.longitude;
    lat = currentPosition.latitude;
    var response;
    print("$lat , $long");

    String geocodeAPIKEY = 'AIzaSyAxkyj1oYDHE7kYo3rd7JQAv8M3HOOwGzI';
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&location_type=ROOFTOP&result_type=street_address&key=$geocodeAPIKEY&language=ko';
    response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      address = jsonDecode(response.body)["results"][0]["formatted_address"];
      var jsonString = utf8.decode(response.bodyBytes);
      print(url);
      return locationDataFromJson(jsonString);
    } else {
      print('접속 오류');
      return null;
    }
  }
}

class MapLocatonService {}

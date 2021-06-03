import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:bilrun/model/location_model.dart';

class LocationService {
  static String address;
  static Future<LocationData> convertLatLngToLocation(LatLng latlng) async {
    var response;
    double lat = latlng.latitude;
    double lng = latlng.longitude;

    String geocodeAPIKEY = 'AIzaSyAxkyj1oYDHE7kYo3rd7JQAv8M3HOOwGzI';
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&location_type=ROOFTOP&result_type=street_address&key=$geocodeAPIKEY&language=ko';
    response = await http.get(Uri.parse(url));
    //print("check : $url");

    if (response.statusCode == 200) {
      //address = jsonDecode(response.body)["results"][0]["formatted_address"];
      var jsonString = utf8.decode(response.bodyBytes);
      address = jsonDecode(response.body)['results'][0]['formatted_address']
          .toString()
          .substring(5);
      // print(address);
      // print(jsonDecode(response.body)['results'][0]['formatted_address']);
      return locationDataFromJson(jsonString);
    } else {
      print('접속 오류');
      return null;
    }
  }
}

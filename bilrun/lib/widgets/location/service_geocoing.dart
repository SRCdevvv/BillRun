import 'dart:convert';

import 'package:bilrun/model/convert_location_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:bilrun/model/location_model.dart';

class GeocodingService {
  static double geoLat;
  static double geoLng;
  static Future<ConvertLocationData> convertLocationToLatlng(
      String locationAddress) async {
    var response;

    String geocodeAPIKEY = 'AIzaSyAxkyj1oYDHE7kYo3rd7JQAv8M3HOOwGzI';
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$locationAddress&key=$geocodeAPIKEY&language=ko';
    response = await http.get(Uri.parse(url));
    print("check geocode : $url");

    if (response.statusCode == 200) {
      var jsonString = utf8.decode(response.bodyBytes);
      var jsonData = jsonDecode(response.body);
      geoLat = jsonData["results"][0]["geometry"]["location"]["lat"];
      geoLng = jsonData["results"][0]["geometry"]["location"]["lng"];

      print('$geoLat  $geoLng');

      return convertLocationDataFromJson(jsonString);
    } else {
      print('접속 오류');
      return null;
    }
  }
}

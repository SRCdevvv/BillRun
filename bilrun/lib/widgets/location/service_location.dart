import 'dart:convert';
import 'package:bilrun/widgets/etc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:bilrun/model/location_model.dart';

class LocationService {
  static String address;
  static String productAddress;
  static Future<LocationData> convertLatLngToLocation(LatLng latlng) async {
    var response;
    double lat = latlng.latitude;
    double lng = latlng.longitude;

    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&location_type=ROOFTOP&result_type=street_address&key=$geocodeAPIKEY&language=ko';

    try {
      response = await http.get(Uri.parse(url));

      print("location check : $url");
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      //address = jsonDecode(response.body)["results"][0]["formatted_address"];
      var jsonString = utf8.decode(response.bodyBytes);
      address = jsonDecode(response.body)['results'][0]['formatted_address']
          .toString()
          .substring(5);

      // for (int i = 5; i < 2; i--) {
      //   productAddress = jsonDecode(response.body)['results'][0]
      //           ["address_components"][i]["long_name"]
      //       .toString();
      //   print(productAddress);
      // }

      productAddress = jsonDecode(response.body)['results'][0]
                  ["address_components"][5]["long_name"]
              .toString() +
          " " +
          jsonDecode(response.body)['results'][0]["address_components"][4]
                  ["long_name"]
              .toString() +
          " " +
          jsonDecode(response.body)['results'][0]["address_components"][3]
                  ["long_name"]
              .toString();
      print(productAddress);

      // print(address);
      // print(jsonDecode(response.body)['results'][0]['formatted_address']);
      return locationDataFromJson(jsonString);
    } else {
      print('접속 오류');
      return null;
    }
  }
}

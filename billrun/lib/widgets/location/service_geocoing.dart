import 'dart:convert';
import 'package:bilrun/model/convert_location_model.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;

class GeocodingService {
  static double geoLat;
  static double geoLng;
  static Future<ConvertLocationData> convertLocationToLatlng(
      String locationAddress) async {
    var response;

    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$locationAddress&key=$geocodeAPIKEY&language=ko';

    try {
      response = await http.get(Uri.parse(url));
      print("check geocode : $url");
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      var jsonString = utf8.decode(response.bodyBytes);
      var jsonData = jsonDecode(response.body);
      geoLat = jsonData["results"][0]["geometry"]["location"]["lat"];
      geoLng = jsonData["results"][0]["geometry"]["location"]["lng"];

      //print('$geoLat  $geoLng');

      return convertLocationDataFromJson(jsonString);
    } else {
      print('접속 오류');
      return null;
    }
  }
}

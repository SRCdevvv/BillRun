import 'package:bilrun/widgets/etc.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

class postProduct {
  static int status;
  static Future<int> getOrCreateInitAPIData(
      RegisterUserId,
      RegisterCategory,
      RegisterPrice,
      RegisterName,
      RegisterDescription,
      RegisterCaution,
      RegisterMenu,
      RegisterPriceProp,
      RegisterImage1,
      RegisterImage2,
      RegisterImage3,
      RegisterImage4,
      RegisterImage5,
      RegisterLocation,
      RegisterLat,
      RegisterLng,
      UserToken) async {
    String url = '$serviceUrl/product_post/';

    try {
      var uri = Uri.parse('$url');

      var request = http.MultipartRequest('POST', uri);
      request.headers["authorization"] = "jwt $UserToken";
      request.fields["name"] = "$RegisterName";
      request.fields["description"] = "$RegisterDescription";
      request.fields["caution"] = "$RegisterCaution";
      request.fields["price"] = "$RegisterPrice";
      request.fields["price_prop"] = "$RegisterPriceProp";
      request.fields["user"] = "$RegisterUserId";
      request.fields["lend"] = "$RegisterCategory";
      request.fields["category"] = "$RegisterMenu";
      request.fields["place_option"] = "true";
      // request.fields["location"] = "$RegisterLocation";
      request.fields["lat"] = "$RegisterLat";
      request.fields["lng"] = "$RegisterLng";
      request.fields["photo1"] = "$RegisterImage1";
      request.fields["photo2"] = "$RegisterImage2";
      request.fields["photo3"] = "$RegisterImage3";
      request.fields["photo4"] = "$RegisterImage4";
      request.fields["photo5"] = "$RegisterImage5";

//TODO 사진 path 구하기...

      http.StreamedResponse response = await request.send();
      status = response.statusCode;
      if (response.statusCode == 201) {
        print("success :: $status");
      } else {
        print("fail: ${response.statusCode}");
      }
    } catch (e) {
      print("error: $e");
    }
    return status;
  }
}

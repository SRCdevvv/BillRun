import 'package:bilrun/widgets/etc.dart';
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
      RegisterImage,
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

//TODO 사진 path 구하기...

      // final multipartFile =
      //     await http.MultipartFile.fromPath('Image', '$RegisterImage');
      // request.files.add(multipartFile);

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

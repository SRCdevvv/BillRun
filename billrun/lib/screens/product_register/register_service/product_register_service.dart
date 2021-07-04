import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;

Future<void> getOrCreateInitAPIData(
    RegisterCategory,
    RegisterPrice,
    RegisterName,
    RegisterDescription,
    RegisterCaution,
    RegisterMenu,
    RegisterPriceProp,
    RegisterImage,
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
    request.fields["user.id"] = "1";
    request.fields["lend"] = "$RegisterCategory";
    request.fields["category"] = "$RegisterMenu";
    request.fields["place_option"] = "true";
    request.fields["lat"] = "37.12452";
    request.fields["lng"] = "127.1452";

//TODO 사진 path 구하기...

    // final multipartFile =
    //     await http.MultipartFile.fromPath('Image', '$RegisterImage');
    // request.files.add(multipartFile);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201) {
      print("success");
    } else {
      print("fail: ${response.statusCode}");
    }
  } catch (e) {
    print("error: $e");
  }
}

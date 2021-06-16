import 'dart:convert';
import 'dart:io';
import 'package:bilrun/main.dart';
import 'package:bilrun/model/product_detail_model.dart';
import 'package:bilrun/screens/product_detail/product_detail_main.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<DetailProduct> getOrCreateInitAPIData(
  RegisterPrice,
  RegisterName,
  RegisterDescription,
  RegisterCaution,
  RegisterCategory,
  RegisterPriceProp,
) async {
  String url = '$serviceUrl/product_list/';

  try {
    var uri = Uri.parse('$url');

    var request = http.MultipartRequest('POST', uri);
    request.fields["name"] = "$RegisterName";
    request.fields["description"] = "$RegisterDescription";
    request.fields["caution"] = "$RegisterCaution";
    request.fields["price"] = "$RegisterPrice";
    request.fields["price_prop"] = "$RegisterPriceProp";
    request.fields["user.id"] = "1";
    request.fields["lend"] = "$RegisterCategory";
    request.fields["category"] = "Digital";
    request.fields["place_option"] = "true";

    // request.files.add(await http.MultipartFile.fromPath(
    //     'file', '${RegisterImage[0]}',
    //     contentType: MediaType('image', 'jpg')));

    // var multipartFile = http.MultipartFile.fromBytes(
    //   'file',
    //   (await rootBundle.load('assets/images/main_1.jpg')).buffer.asUint8List(),
    //   filename: 'test01.jpg',
    //   contentType: MediaType('image', 'jpg'),
    // );
    //
    // request.files.add(multipartFile);

    // final multipartFile =
    //     await http.MultipartFile.fromPath('Image', '${RegisterImage[0]}');
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

  // var response = await request.send();
  //
  // if (response.statusCode == 200) print('Upload');
}

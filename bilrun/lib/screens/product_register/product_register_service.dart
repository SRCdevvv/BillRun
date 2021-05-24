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




Future<DetailProduct> getOrCreateInitAPIData( RegisterPrice,RegisterName, RegisterDescription, RegisterCaution, RegisterCategory, RegisterPriceProp,RegisterImage) async {
  String url = '$serviceUrl/product_list/';
  var formData =  {
    "name": "$RegisterName",
    "description": "$RegisterDescription",
    "caution": "$RegisterCaution",
    "price": "$RegisterPrice",
    "price_prop": "$RegisterPriceProp",
    "user": {
      "id": 1,
      // "place": "서울시 중구",
      // "username": "yoonyoung",
      // "nickname": "배가고프군그래",
      // "phone": "",
      // "user": 2
    },
    "photos": ["$RegisterImage"],
    "lend": true,
    "category": "Digital",
    "place_option": true,
    //"hits": 51,
    //"like_count": 3,
    //"created_at": "2021-04-14T17:20:13.460141",
   // "updated_at": "2021-05-14T13:10:27.755806"
  };





  //
  // var response = await http.post(Uri.parse(url),
  //     headers:
  //     {"Accept": "application/json",
  //      "content-type":"application/json",},
  //       body: json.encode(formData));
  //
  //
  //
  // if (response.statusCode == 201) {
  //   var data =
  //       utf8.decode(response.bodyBytes);
  //
  //
  //   return detailProductFromJson(data);
  //
  //
  // } else {
  //   print(response.statusCode);
  //   throw Exception('post error');
  //   // 응답이 200이 아닐경우 예외처리
  // }
  // //
  // var multipartFile = http.MultipartFile.fromBytes('photo', (await rootBundle.load(RegisterImage[0])).buffer.asUint8List(),
  // filename: 'file1.jpg', contentType: MediaType('image','jpg'),);
  //
  // var bytes= (await rootBundle.load('${RegisterImage[0]}')).buffer.asUint8List();
  // var mpFile = http.MultipartFile.fromBytes('img', bytes,filename: 'photo.jpg');

  var uri = Uri.parse('$url');

  var request = http.MultipartRequest('POST', uri);
  request.fields["name"]= "$RegisterName";
  request.fields["description"]="$RegisterDescription";
  request.fields["caution"] ="$RegisterCaution";
  request.fields["price"]="$RegisterPrice";
  request.fields["price_prop"]="$RegisterPriceProp";
  request.fields["user.id"]="1";
  request.fields["lend"]="$RegisterCategory";
  request.fields["category"]="Digital";
  request.fields["place_option"]="true";




      request.files.add(await http.MultipartFile.fromPath('photo', '${RegisterImage[0]}';
 //        contentType: MediaType('image', 'jpg')));
//  request.files.add(mpFile);



  var response =await request.send();

  if(response.statusCode == 200) print('Upload');








}

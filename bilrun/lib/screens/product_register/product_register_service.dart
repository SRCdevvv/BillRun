import 'dart:convert';
import 'package:bilrun/main.dart';
import 'package:bilrun/model/product_detail_model.dart';
import 'package:bilrun/screens/product_detail/product_detail_main.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;




Future<DetailProduct> getOrCreateInitAPIData( RegisterPrice,RegisterName, RegisterDescription, RegisterCaution, RegisterCategory, RegisterPriceProp, RegisterImages) async {
  String url = '$serviceUrl/product_list/';
  var formData =  {
    "name": "$RegisterName",
    "description": "$RegisterDescription",
    "caution": "$RegisterCaution",
    "price": "$RegisterPrice",
    "price_prop": "$RegisterPriceProp",
    "user": {
      "id": 1,
      "place": "서울시 중구",
      "username": "yoonyoung",
      "nickname": "배가고프군그래",
      "phone": "",
      "user": 2
    },
    // "photos": [
    //   {
    //     "photo":"http://54.144.140.114/media/photo/KakaoTalk_Photo_2021-05-11-12-10-09.jpeg"
    //   },
   // ],
    "lend": true,
    "category": "Digital",
    "place_option": true,
    //"hits": 51,
    //"like_count": 3,
    //"created_at": "2021-04-14T17:20:13.460141",
   // "updated_at": "2021-05-14T13:10:27.755806"
  };
  var response = await http.post(url,
      headers:
      {"Accept": "application/json",
       "content-type":"application/json",},
        body: json.encode(formData));

  if (response.statusCode == 201) {
    var data =
        utf8.decode(response.bodyBytes);


   // Get.back();

    //TODO db 고쳐지면 새로 만든거 아이디 찍히는지 확인하고 상세페이지로 넘어가는지 확인


    return detailProductFromJson(data);


  } else {
    print(response.statusCode);
    throw Exception('post error');
    // 응답이 200이 아닐경우 예외처리
  }
}

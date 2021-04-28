import 'dart:convert';
import 'package:bilrun/main.dart';
import 'package:bilrun/model/product_detail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;




Future<DetailProduct> getOrCreateInitAPIData( RegisterPrice,RegisterName, RegisterDescription, RegisterCaution, RegisterCategory, RegisterPriceProp) async {
  String url = 'http://35.175.245.21:8000/api/product_list/';
  var formData = {

    "name": "$RegisterName",
    "description": "$RegisterDescription",
    "caution": "$RegisterCaution",
    "price": "$RegisterPrice",
    "price_prop": "$RegisterPriceProp",
    "user_id": {
      "id": "1",
      "place": "서울시 중구",
      "username": "yoonyoung",
      "nickname": "배가고프군그래",
      "money": "5000",
      "level": "0",
      "profile": null,
      "user": "2"
    },
    "category": RegisterCategory,
    "place_option": true,

  };
  var response = await http.post(url,
      headers:
      {"Accept": "application/json",
       "content-type":"application/json",},
        body: json.encode(formData));

  if (response.statusCode == 201) {
    var data =
        utf8.decode(response.bodyBytes);
    print(detailProductFromJson(data));
    print(response.statusCode);

    return detailProductFromJson(data);


  } else {
    print(response.statusCode);
    throw Exception('post error');
    // 응답이 200이 아닐경우 예외처리
  }
}

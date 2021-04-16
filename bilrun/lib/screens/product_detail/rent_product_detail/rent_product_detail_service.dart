import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/rent_product_detail_model.dart';



class RentDetailService {
  static var client = http.Client();


  static Future<RentDetailProduct> fetchRentDetailInfo() async{

    var IdOfProduct = Get.arguments;

    var response = await client.get('http://35.175.245.21:8000/api/rent_product_list/$IdOfProduct?format=json');

    if(response.statusCode ==200){
      String jsonString = utf8.decode(response.bodyBytes);
     // print('아이디: $IdOfProduct');
     // print('서비스: ${RentDetailProductFromJson(jsonString)}');
      return RentDetailProductFromJson(jsonString);
    }
    else{
      print('접속오류');
      return null;
    }
  }

}
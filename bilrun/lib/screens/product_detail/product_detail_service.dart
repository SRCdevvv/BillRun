import 'dart:convert';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_detail_model.dart';



class DetailProductService {
  static var client = http.Client();


  static Future<DetailProduct> fetchLendDetailInfo() async{

    var IdOfProduct = Get.arguments;

    // var IdOfProduct=1;
    var response = await client.get('$serviceUrl/lend_product_list/$IdOfProduct?format=json');

    if(response.statusCode ==200){
      String jsonString = utf8.decode(response.bodyBytes);
       print('아이디: $IdOfProduct');
      print('서비스: ${detailProductFromJson(jsonString)}');
      return detailProductFromJson(jsonString);
    }
    else{
      print('접속오류');
      return null;
    }
  }

}
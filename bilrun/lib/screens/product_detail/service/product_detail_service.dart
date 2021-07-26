import 'dart:convert';
import 'dart:io';
import 'package:bilrun/screens/lend/lend_controller.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/screens/product_detail/product_detail_main.dart';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_detail_model.dart';

class DetailProductService {
  static var client = http.Client();

  static var userToken = MainScreenState.mainUserToken;

  static Future<DetailProduct> fetchLendDetailInfo(int productID) async {
    var response;

    // var IdOfProduct=1;

    response = await client.get(
      Uri.parse('$serviceUrl/product_list/product/$productID'),
      headers: {HttpHeaders.authorizationHeader: "jwt $userToken"},
    );
    print('detail sucess: $userToken');
    print('아이디: $productID');

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);
      print('서비스: ${detailProductFromJson(jsonString)}');
      return detailProductFromJson(jsonString);
    } else {
      print('접속오류 ${response.statusCode}');
      return null;
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;
import 'package:bilrun/model/product_list_model.dart';

class RentProductListService {
  static var client = http.Client();

  static Future<List<ProductList>> fetchRentProducts(var userToken) async {
    var response = await client.get(
      Uri.parse('$serviceUrl/product_list/rent/'),
      headers: {HttpHeaders.authorizationHeader: "jwt $userToken"},
    );

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);
      print("빌림 페이지 연결 성공");
      return productListFromJson(jsonString);
    } else {
      print("빌림 페이지 연결 실패 ${response.statusCode}");
      return null;
    }
  }
}

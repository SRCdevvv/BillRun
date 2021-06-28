import 'dart:convert';
import 'dart:io';
import 'package:bilrun/widgets/etc.dart';
import 'package:http/http.dart' as http;
import 'package:bilrun/model/product_list_model.dart';

class ProductListService {
  static var client = http.Client();

  static Future<List<ProductList>> fetchLendProducts(var userToken) async {
    var response = await client.get(
      Uri.parse('$serviceUrl/product_list/lend/'),
      headers: {HttpHeaders.authorizationHeader: "jwt $userToken"},
    );
    print("서비스에서 유저토큰 : $userToken");
    // print('lend : ${response.body}');

    if (response.statusCode == 200) {
      print("연결 성공");
      String jsonString = utf8.decode(response.bodyBytes);

      return productListFromJson(jsonString);
    } else {
      print("service Error ${response.statusCode}");
      return null;
    }
  }
}

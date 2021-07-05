import 'dart:convert';
import 'dart:io';
import 'package:bilrun/widgets/etc.dart';

import 'package:http/http.dart' as http;
import 'package:bilrun/model/product_list_model.dart';

class EtcProductService {
  static var client = http.Client();
  static bool result;

  static Future<List<ProductList>> fetchEtcProducts(
      int userId, var userToken) async {
    var response = await client.get(
        Uri.parse('$serviceUrl/lend_product_list/user_id=$userId?format=json'),
        headers: {HttpHeaders.authorizationHeader: "jwt $userToken"});

    if (response.statusCode == 200) {
      String jsonString = utf8.decode(response.bodyBytes);
      result = true;

      return productListFromJson(jsonString);
    } else {
      result = false;
      return null;
    }
  }
}
